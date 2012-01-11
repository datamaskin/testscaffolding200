
<%@ page import="com.sexingtechnologies.mathconstant.PiConstant" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'piConstant.label', default: 'PiConstant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require module="filterpane"/>
	</head>
    <content tag="navigation"> 
	    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </content>

	<body>
		<a href="#list-piConstant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-piConstant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <filterpane:currentCriteria domainBean="com.sexingtechnologies.mathconstant.PiConstant"/> 
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="denominator" title="${message(code: 'piConstant.denominator.label', default: 'Denominator')}" />
					
						<g:sortableColumn property="iterations" title="${message(code: 'piConstant.iterations.label', default: 'Iterations')}" />
					
						<g:sortableColumn property="numerator" title="${message(code: 'piConstant.numerator.label', default: 'Numerator')}" />
					
						<g:sortableColumn property="sum" title="${message(code: 'piConstant.sum.label', default: 'Sum')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${piConstantInstanceList}" status="i" var="piConstantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${piConstantInstance.id}">${fieldValue(bean: piConstantInstance, field: "denominator")}</g:link></td>
					
						<td>${fieldValue(bean: piConstantInstance, field: "iterations")}</td>
					
						<td>${fieldValue(bean: piConstantInstance, field: "numerator")}</td>
					
						<td>${fieldValue(bean: piConstantInstance, field: "sum")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            <filterpane:filterPane domain="com.sexingtechnologies.mathconstant.PiConstant" dialog="true" />
                                   
            <filterpane:filterButton/> 
            <filterpane:isNotFiltered>Unfiltered!</filterpane:isNotFiltered>
            <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
			<div class="pagination">
				<g:paginate total="${piConstantInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
