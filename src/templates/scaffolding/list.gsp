<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require module="filterpane"/>
	</head>
    <content tag="navigation"> <%/* this section is referred from the layouttemplate using g:pageproperty */%>
	    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </content>

	<body>
		<a href="#list-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="\${flash.message}">
			<div class="message" role="status">\${flash.message}</div>
			</g:if>
            <filterpane:currentCriteria domainBean="${domainClass.clazz.name}"/> <%/* removeImgDir="images" removeImgFile="bullet_delete.png" /> */%>
			<table>
				<thead>
					<tr>
					<%  def props
                        try {
                            props = domainClass.properties.findAll { it.name in domainClass.clazz.scaffold.showInList }
                        } catch (e) {
                            excludedProps = Event.allEvents.toList() << 'id' << 'version'
                            allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                            props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && !Collection.isAssignableFrom(it.type) }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                        }
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
					</tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
					<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
					<%          } else { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%  }   }   } %>
					</tr>
				</g:each>
				</tbody>
			</table>
            <filterpane:filterPane domain="${domainClass.clazz.name}" dialog="true" />
                                   <%/* excludeProperties="bloodcase,dnacase"
                                   filterPropertyValues="${[dateCreated:[years:2015..2010,precision:'day'], birthdate:[years:1980..2015,precision:'day']]}"
                                   titleKey="fp.tag.filterPane.titleText" /> */%>
            <filterpane:filterButton/> <%/* textKey="fp.tag.filterButton.text" appliedTextKey="fp.tag.filterButton.appliedText" text="Filter Me" appliedText="Change Filter" /> */%>
            <filterpane:isNotFiltered>Unfiltered!</filterpane:isNotFiltered>
            <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
			<div class="pagination">
				<g:paginate total="\${${propertyName}Total}" />
			</div>
		</div>
	</body>
</html>
