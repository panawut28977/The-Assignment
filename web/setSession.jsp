<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${param.acct eq 'th'}">
        <c:set var="accType" value="th" scope="session" />
    </c:when>
    <c:when test="${param.acct eq 'st'}">
        <c:set var="accType" value="st" scope="session" /></c:when>
</c:choose>
<script>
    location.href = "home.jsp";
</script>