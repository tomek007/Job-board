<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="../header.jsp" %>

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

        <div class="heading-title">
            <div class="container">
                <h3>Oferta pracy numer: ${post.id}</h3>
            </div>
        </div>

        <section class="main-content">

            <div class="container">

                <div class="row">

                    <div class="col col-12">

                        <div class="post-content">

                            <table>
                                <tr>
                                    <td>Tytuł:</td>
                                    <td><h3>${post.title}</h3></td>
                                </tr>
                                <tr>
                                    <td>Kategoria:</td>
                                    <td>${post.category.category_name}</td>
                                </tr>
                                <tr>
                                    <td>Opis:</td>
                                    <td>${post.description}</td>
                                </tr>
                                <tr>
                                    <td>Miejscowość:</td>
                                    <td>${post.location}</td>
                                </tr>
                                <tr>
                                    <td>Województwo:</td>
                                    <td>${post.province.province_name}</td>
                                </tr>
                                <tr>
                                    <td>Firma:</td>
                                    <td>${post.user.company}</td>
                                </tr>
                                <tr>
                                    <td>Data dodania:</td>
                                    <td>${post.createDateTime}</td>
                                </tr>
                                <tr>
                                    <td>Data modyfikacji:</td>
                                    <td>${post.updateDateTime}</td>
                                </tr>

                            </table>

                            <div class="btns-wrap">
                                <a href="${pageContext.request.contextPath}/post/show-all" class="btn btn-default">lista ofert pracy</a>
                                <a href="${pageContext.request.contextPath}/" class="btn btn-back" style="margin-right: 10px;">powrót do strony głównej</a>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

    </div>

</div>


<%@include file="../footer.jsp" %>