<%@ page import="com.sexingtechnologies.mathconstant.PiConstant" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'piConstant.label', default: 'PiConstant')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<content tag="navigation">
    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
</content>
<a href="#edit-piConstant" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div id="edit-piConstant" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${piConstantInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${piConstantInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${piConstantInstance?.id}"/>
        <g:hiddenField name="version" value="${piConstantInstance?.version}"/>
        <fieldset class="form">
            <form:bean bean="${piConstantInstance}"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
