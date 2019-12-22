<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="header.jsp" %>

    <div class="site-wrapper">

        <div class="main-wrapper">

            <section class="intro">

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

                    <div id="search-form">
                        <h2>Najlepsze oferty pracy dla programistów w zasięgu ręki!</h2>
                        <form action="${pageContext.request.contextPath}/post/search" method="get">
                            <input class="input-text" type="text" name="post_search" placeholder="Szukaj...">
                            <input class="input-submit" type="submit" value="Znajdź ofertę">
                        </form>
                    </div>

                </div>
            </section>

            <div class="heading-title">
                <div class="container">
                    <h3>Najnowsze oferty</h3>
                </div>
            </div>

            <section class="main-content">
                <div class="container">
                    <div class="row">

                            <c:forEach items="${latests_posts}" var="post">
                                <div class="col col-sm-4">
                                    <div class="inner-col">
                                        <h4><a href="${pageContext.request.contextPath}/post/${post.id}">${post.title}</a></h4>
                                        <h5>${post.location}</h5>
                                    </div>
                                </div>
                            </c:forEach>

                    </div>
                </div>
            </section>

        </div>

    </div>



<%@include file="footer.jsp" %>