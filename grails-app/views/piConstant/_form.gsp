<%@ page import="com.sexingtechnologies.mathconstant.PiConstant" %>



<div class="fieldcontain ${hasErrors(bean: piConstantInstance, field: 'denominator', 'error')} required">
    <label for="denominator">
        <g:message code="piConstant.denominator.label" default="Denominator"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="denominator" required="" value="${fieldValue(bean: piConstantInstance, field: 'denominator')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: piConstantInstance, field: 'iterations', 'error')} required">
    <label for="iterations">
        <g:message code="piConstant.iterations.label" default="Iterations"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="iterations" required="" value="${fieldValue(bean: piConstantInstance, field: 'iterations')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: piConstantInstance, field: 'numerator', 'error')} required">
    <label for="numerator">
        <g:message code="piConstant.numerator.label" default="Numerator"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="numerator" required="" value="${fieldValue(bean: piConstantInstance, field: 'numerator')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: piConstantInstance, field: 'sum', 'error')} required">
    <label for="sum">
        <g:message code="piConstant.sum.label" default="Sum"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="sum" required="" value="${fieldValue(bean: piConstantInstance, field: 'sum')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: piConstantInstance, field: 'temp', 'error')} required">
    <label for="temp">
        <g:message code="piConstant.temp.label" default="Temp"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="temp" required="" value="${fieldValue(bean: piConstantInstance, field: 'temp')}"/>
</div>

