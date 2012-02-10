<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 1/30/12
  Time: 4:29 PM
  Project: Bullseye2
--%>

<r:require modules='dropmenu'/>
<r:script>
$(function() {
    $(".apple").dropmenu({
           	  effect  : 'fade',
              speed   : 'fast',
              nbsp    : true,
              timeout : 500,
              maxWidth: 200
           });

    /* remove empty menus TODO: not yet complete */
    $('#menubar ul').not(':has(li)').prev().remove();
    $('#menubar ul').not(':has(li)').remove();

 });
</r:script>

<r:img id='logo' file="logo.jpg"/>
<ul class="apple">
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

    %{--<li>
        <span>Animals</span>
        <ul>
            <beye:menuitem controller="bull" action="list">Bulls</beye:menuitem>
            <beye:menuitem controller="bull" action="relocate">relocate a Bull</beye:menuitem>
            <beye:menuitem controller="teaser" action="list">Teasers</beye:menuitem>
            <beye:menuitem controller="rfid" action="list">Rfid</beye:menuitem>
            <beye:menuitem controller="bullAdmission" action="list">Admissions</beye:menuitem>
        </ul>
    </li>


    <li><span>Arena</span>
        <ul>
            <beye:menuitem controller="collectionPlan" action="list">Collection Plans</beye:menuitem>
            <beye:menuitem controller="collectionSchedule" action="list">Schedule List</beye:menuitem>
            <beye:menuitem controller="collectionSchedule" action="schedule">Scheduler</beye:menuitem>
        </ul>
    </li>

    <li><span>Laboratory</span>
        <ul>
            <beye:menuitem controller="ejaculateCollection" action="list">Ejac. Coll.</beye:menuitem>
            <beye:menuitem controller="sampleTube" action="list">Sample Tubes</beye:menuitem>
            <beye:menuitem controller="sortedTube" action="list">Sorted Tubes</beye:menuitem>
            <beye:menuitem controller="ejaculateCollectionConventional"
                           action="list">Ejac.&nbsp;Coll.&nbsp;Conv.</beye:menuitem>
            <beye:menuitem controller="laboratoryProcess" action="incubationMachine"
                           params="[fakeip:'127.0.0.1']">incubation machine (ip: 127.0.0.1)</beye:menuitem>
            <beye:menuitem controller="laboratoryProcess" action="moFloMachine"
                           params="[fakeip:'192.168.0.1']">moflo machine (ip: 192.168.0.1)</beye:menuitem>
            <beye:menuitem controller="laboratoryProcess" action="sortingMachine"
                           params="[fakeip:'192.168.1.1']">sorting place (ip: 192.168.1.1)</beye:menuitem>
        </ul>
    </li>
    <li><span>Coldroom</span>
        <ul>
            <beye:menuitem controller="freeze" action="list">Freeze</beye:menuitem>

            <beye:menuitem controller="freeze" action="addLossFilling">add filling loss</beye:menuitem>
            <beye:menuitem controller="freeze" action="addLossCooling">add cooling loss</beye:menuitem>
            <beye:menuitem controller="freeze" action="addLossHoldingTank">add holding tank loss</beye:menuitem>
            <beye:menuitem controller="freeze" action="addLossTransferTank">add transfer tank loss</beye:menuitem>
            <beye:menuitem controller="freezeQC" action="create">add QC</beye:menuitem>
        </ul>
    </li>
    <li><span>Health</span>
        <ul>
            <beye:menuitem controller="protocol" action="list">Protocols</beye:menuitem>
            <beye:menuitem controller="healthTest" action="list">Health Tests</beye:menuitem>
            <beye:menuitem controller="healthTestResult" action="list">Health Test Results</beye:menuitem>
        </ul>
    </li>--}%


    <li><span>Scaffolding</span>
        <ul>
            <beye:menuitem controller="PiConstantController" action="list">PI Constant</beye:menuitem>
        </ul>
    </li>
    <%--<li>
      <span>Horses</span>
    </li>
    <li>
      <span>Dummy1</span>
    </li>
    <li>
      <span>Dummy2</span>
    </li>--%>
    %{--<li>
        <span>Admin</span>
        <ul>
            <beye:menuitem controller="role">Roles</beye:menuitem>
            <beye:menuitem controller="user">Users</beye:menuitem>
            <beye:menuitem controller="requestmap">Requestmap</beye:menuitem>
            <beye:menuitem controller="location">Locations</beye:menuitem>
        </ul>
    </li>
    <li>
        <span>Siteadmin</span>
        <ul>
            <beye:menuitem controller="incubationMachine">incubation machines</beye:menuitem>
            <beye:menuitem controller="moFloMachine">moflo machines</beye:menuitem>
            <beye:menuitem controller="sortingMachine">sorting machines</beye:menuitem>
            <beye:menuitem controller="tank">manage tanks</beye:menuitem>
        </ul>
    </li>
--}%
    <g:pageProperty name="page.navigation"/>
</ul>