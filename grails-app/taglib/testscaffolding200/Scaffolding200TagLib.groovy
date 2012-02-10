package testscaffolding200

import org.codehaus.groovy.grails.plugins.web.taglib.FormatTagLib
import java.text.DecimalFormatSymbols
import java.text.DecimalFormat

class Scaffolding200TagLib {

    def currentTenant

    static namespace = 'beye'

	def formatSelect = { attrs ->
		def format = attrs.format
		def locale = new FormatTagLib().resolveLocale(attrs.locale)

		if (format) {
			DecimalFormatSymbols dcfs = locale ? new DecimalFormatSymbols( locale ) : new DecimalFormatSymbols()
            DecimalFormat decimalFormat = new DecimalFormat(format, dcfs)

			attrs.from = attrs.from.collect { decimalFormat.format(it) }
		}
		out << select(attrs)
	}

    /**
     * provide a complex widget consisting of two selects. One holds the list of possible selectable elements,
     * the other the list of actual selected elements
     * for ui styling, the following css classes might be used:
     * select1: left hand selectbox
     * select2: right hand select box
     * add: add button
     * remove: remove button
     * transferselect: div around select box
     */
    def inAndOutWidget = { attrs, body ->
        def from = attrs.remove('from')
        def bean = attrs.remove('bean')
        def field = attrs.remove('field')
        //def optionValue = attrs.remove('optionValue') ?: ""
        //def size = attrs.remove('size') ?: "10"

        def selectAttrs = attrs
        selectAttrs.optionKey = 'id'
        selectAttrs.multiple = true

        selectAttrs.class = "select1"
        selectAttrs.from = from - bean?."$field"
        selectAttrs.name = "${field}From"
        def selectAttrsBackup = [:] + selectAttrs // copying of selectAttrs is necessary since select() modifies atts map
        out << "<div class='transferselect'>"
        out << select(selectAttrs)
        out << '<a href="#" class="add">' << message(code: "add", default: "Add") << '&gt;&gt;</a>'
        out << "</div>"

        selectAttrs = selectAttrsBackup
        selectAttrs.class = "select2"
        selectAttrs.from = bean?."$field"
        selectAttrs.name = field
        out << "<div class='transferselect'>"
        out << select(selectAttrs)
        out << '<a href="#" class="remove">&lt;&lt;' << message(code: "remove", default: "Remove") << '</a>'
        out << "</div>"

    }

    /**
     * provides jQuery code to handle the inAndOutWidget's add and remove buttons
     *
     */
    def inAndOutWidget_js = { attrs, body ->
        out << jq.jquery {
            '''

$('.add').click(function() {
  var parent = $(this).closest(".transferselect").parent();
  var dest = parent.find('.select2');
  return !parent.find('.select1 option:selected').remove().appendTo(dest);
});
$('.remove').click(function() {
  var parent = $(this).closest(".transferselect").parent();
  var dest = parent.find('.select1');
  return !parent.find('.select2 option:selected').remove().appendTo(dest);
});

$('form').submit(function() {
  $('.select2 option').each(function(i) {
    $(this).attr("selected", "selected");
  });
});
'''
        }
    }

    /**
     * return the current tenant id or location
     */
    def tenantId = {
        out << currentTenant.get()
    }

    def tenantName = {
        def id = currentTenant.get()
        def name = Location.get(id)?.name ?:"n/a"
        out << name
    }

    /**
     * emitts a link inside a &lt;li&gt; tag if the user has permission to access the resource
     * attributes: see g:link
     *
     */
    def menuitem = { attrs, body ->
        def attrsCopy = attrs.clone() // sec.access empties attrs map, so make a copy
        out << sec.access(attrs) {
            out << '<li>' << link(attrsCopy, body) << '</li>'
        }
    }

    /**
     * renders the 'object' tag for embedding an applet
     * @param id
     * @param clazz
     * @param jars list of jars to use, will be used to construct params name='archive' tag
     * @param width
     * @param height
     * @param params optional map used as object's params
     * @return
     */
    def applet(out, id, clazz, jars, width, height, params=null ) {

        def jarsString = jars.collect { jar -> resource(file:jar) }.join(',')

        out << "<object id='$id' classid='java:${clazz}.class' type='application/x-java-applet' codetype='application/java' width='$width' height='$height'>" // style='display:none;'>"

        out << "<param name='archive' value='$jarsString'/>"
        out << "<param name='code' value='${clazz}'/>"
        out << '<param name="mayscript" value="true" />'
        out << '<param name="scriptable" value="true" />'
        params?.each { k,v ->
            out << "<param name='$k' value='$v'/>"
        }
        out << "</object>"

    }

    def rfidApplet = { attrs, body ->
        def id = attrs.remove('id') ?: 'rfidApplet'
        applet( out, id, 'com.sexingtechnologies.rfid.jumparena.JumpArena', ["JumpArena.jar","avetanaBluetooth.jar"], 650, 250)
    }

    def barcodeApplet = { attrs, body ->
        def id = attrs.remove('id') ?: 'barcodeApplet'
        applet( out, id, "jzebra.RawPrintApplet", ["jzebra.jar"], 1, 1, [printer: 'zebra'])
    }

    def strawHistApplet = { attrs, body ->
        def id = attrs.remove('id') ?: 'strawHistApplet'
//        applet( out, id, "com.sexingtechnologies.strawprint.StrawHist", ["StrawHist.jar"], 100, 40)
        applet( out, id, "com.sexingtechnologies.strawprint.StrawHist", ["StrawHist.jar", 'commons-exec-1.1.jar'], 100, 40)
    }

    def showStrawHistApplet = { attrs, body ->
        def id = attrs.remove('id') ?: 'showStrawHistApplet'
        applet( out, id, "com.sexingtechnologies.strawprint.ShowStrawHist", ["StrawHist.jar"], 100, 40)
//        applet( out, id, "com.sexingtechnologies.strawprint.ShowStrawHist", ["StrawHist.jar", 'commons-exec-1.1.jar'], 100, 40)
    }

    def testApplet = { attrs, body ->
        def id = attrs.remove('id') ?: 'testApplet'
        applet( out, id, "com.sexingtechnologies.strawprint.TestApplet", ["StrawHist.jar"], 325, 325)
    }

}
