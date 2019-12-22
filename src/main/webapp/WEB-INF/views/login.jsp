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

                            <div class="error-message">${loginError}</div>

                            <div class="heading-title">
                                <h3>Formularz logowania</h3>
                            </div>

                            <form class="form form-wrap" action='login' method="post">
                                <input type="hidden" name="userId">
                                <div class="form-group">
                                    <label>Email:</label>
                                    <input type="email" id="email" name="email" required placeholder="email"
                                           class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Hasło:</label>
                                    <input type="password" id="password" required name="password" placeholder="hasło"
                                           class="form-control"/>
                                </div>
                                <button id="loginButton" class="form-control btn btn-primary">Zaloguj</button>
                            </form>


                        </div>


                    </div>

                </div>

            </div>

        </section>

    </div>

</div>


<%@include file="footer.jsp" %>


