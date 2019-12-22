<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="header.jsp" %>

<div class="site-wrapper">

    <div class="main-wrapper">

        <div class="top-bar-wrap">
            <div class="container">
                <div class="top-bar">
                    <a href="${pageContext.request.contextPath}/">
                        <div class="logo txt">Oferty pracy IT</div>
                    </a>

                    <ul class="top-menu">

                        <li><a href="${pageContext.request.contextPath}/post/show-all">Oferty pracy</a></li>

                        <c:if test = "${not empty loggedInUser.name}">
                            <li><a href="${pageContext.request.contextPath}/post/add">Dodaj ofertę</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/show-all">Panel administracyjny</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout">Wyloguj: <span>${loggedInUser.name} ${loggedInUser.lastName}</span></a></li>
                        </c:if>

                        <c:if test = "${empty loggedInUser.name}">
                            <li><a href="${pageContext.request.contextPath}/register">Zarejestruj</a></li>
                            <li><a href="${pageContext.request.contextPath}/login">Zaloguj</a></li>
                        </c:if>

                    </ul>

                </div>

            </div>

        </div>


        <section class="main-content">

            <div class="container">

                <div class="row">

                    <div class="col col-12">

                        <div class="form-credentials">

                            <div class="heading-title">
                                <h3>Formularz rejestracji</h3>
                            </div>

                            <form:form class="form form-wrap" name="input" method="post" modelAttribute="user">

                                <div class="form-group">
                                    <label>Imię:</label>
                                    <form:input class="form-control" type="text" path="name" placeholder="imię"/>
                                </div>

                                <div class="form-group">
                                    <label>Nazwisko:</label>
                                    <form:input class="form-control" type="text" path="lastName" placeholder="nazwisko"/><br/>
                                </div>

                                <div class="form-group">
                                    <label>Firma:</label>
                                    <form:input class="form-control" type="text" path="company" placeholder="firma"/><br/>
                                </div>

                                <div class="form-group">
                                    <label>Hasło:</label>
                                    <form:input class="form-control" type="text" path="password" placeholder="hasło"/><br/>
                                </div>

                                <div class="form-group">
                                    <label>Email:</label>
                                    <form:input class="form-control" type="text" path="email" placeholder="email"/><br/>
                                </div>

                                <input class="form-control btn btn-primary" type="submit" value="Zarejestruj">
                            </form:form>

                        </div>

                    </div>

                </div>

            </div>

        </section>

    </div>

</div>


<%@include file="footer.jsp" %>