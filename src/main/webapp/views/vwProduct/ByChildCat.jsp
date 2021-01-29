<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="products3" scope="request" type="java.util.List<beans.Product>"/>

<t:main>
    <jsp:body>
        <div class="card">
            <div class="card-header">
                <h4>Courses</h4>
            </div>
            <c:choose>
                <c:when test="${products3.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach var="c" items="${products3}">
                                <div class="col-sm-4 mb-3">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/publicsss/imgs/sp/${c.proID}/main_thumbs.jpg" alt="${c.proName}" title="${c.proName}" class="card-img-top" />
                                        <div class="card-body">
                                            <h6 class="card-title">${c.proName}</h6>
                                            <h5 class="card-title text-danger">
                                                <fmt:formatNumber value="${c.price}" type="number"/>
                                            </h5>
                                            <p class="card-text">${c.tinyDes}</p>
                                        </div>
                                        <div class="card-footer">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Product/Detail?id=${c.proID}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>
                                            <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                                <i class="fa fa-play" aria-hidden="true"></i>
                                                View this course
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:main>