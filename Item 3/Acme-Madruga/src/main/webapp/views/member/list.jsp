<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<display:table name="members" id="row"
	requestURI="member/listMyMembers.do" pagesize="5"
	class="displaytag">

	<security:authorize access="hasRole('BROTHERHOOD')">
	<jstl:if test="${ok}">
		<display:column>
			<a href="brotherhood/dropOut.do?memberId=${row.id}">
				<spring:message code="brotherhood.dropOut" />
			</a>
		</display:column>
	</jstl:if>
	</security:authorize>

	<display:column property="name" titleKey="actor.name" />
	
	<display:column property="surname" titleKey="actor.surname" />
	
	<security:authorize access="hasRole('BROTHERHOOD')">
	<display:column titleKey="actor.enrolment">
	<a href="enrolment/brotherhood/display.do?memberId=${row.id}"> <spring:message
				code="member.enrolment" />
		</a>
	</display:column>
	</security:authorize>
	
	<display:column>
		<a href="member/displayTabla.do?memberId=${row.id}"> <spring:message
				code="member.display" />
		</a>
	</display:column>


</display:table>

<jstl:if test="${button}">
<acme:button url="brotherhood/displayTabla.do?brotherhoodId=${brotherhood.id}" name="back" code="float.back"/>
</jstl:if>