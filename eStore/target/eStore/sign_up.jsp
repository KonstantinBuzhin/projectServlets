<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="<c:url value='/static/styles/form.css' />" rel="stylesheet" />
</head>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>




<center>
${param['currentName']}<br><br>
<form action="index.jsp" method="post">
		<input type='hidden' name='currentSession' value="${param['currentSession']}" />
		<input type="hidden" name="currentName" value="${param['currentName']}" />
			<button class='button' type='submit'>Return menu</button>
		</form>
<table>
<tr>

<c:set var='registration' value="failt"/>
<c:if test = "${param['login'] != null}">

	<c:set var="existError" value="false" />
	<c:set var="errorText" value="<ul>" />
	
	
	<c:if test = "${fn:length(param['login'])== 0}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Empty Login</li>" />
	</c:if>
	
	<c:if test = "${fn:length(param['name'])== 0}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Empty Name</li>" />
	</c:if>
	
	<c:if test = "${fn:length(param['password'])== 0}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Empty Password</li>" />
	</c:if>
	
	<c:if test = "${fn:length(param['repassword'])== 0}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Empty Re-Password</li>" />
	</c:if>
	
	<c:if test = "${!param['re-password'] eq param['password']}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Passwords aren`t equals</li>" />
	</c:if>
	
	<c:if test = "${param['gender']== null}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Choose your gender</li>" />
	</c:if>
	
	<c:if test = "${param['address'] eq 'Choose'}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Choose your address</li>" />
	</c:if>
	
	<c:if test = "${fn:length(param['comments'])== 0}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Empty Comments</li>" />
	</c:if>
	
	<c:if test = "${param['amigo']== null}">
		<c:set var="existError" value="true" />
		<c:set var="errorText" value="${errorText}<li>Confirm installation AmigoBrowser</li>" />
	</c:if>
	
	<c:set var="errorText" value="${errorText}</ul>" />
	
	<c:if test = "${existError eq 'true'}">
		<td>${errorText}</td>
	</c:if>
	
	<c:if test = "${existError eq 'false'}">
		
		<jsp:useBean id="checkerInsert" class="homework06.DBInserter"/>
		
		<jsp:setProperty name='checkerInsert' property='login' value="${param['login']}"/>

		<c:set var='checkLogin' value="${checkerInsert.checkLogin}"/>
		
		<c:if test = "${checkLogin eq 'false'}">
			
			 <fmt:parseNumber var = "i" integerOnly = "true" 
			type = "number" value = "${param['age']}" />
			
			<jsp:setProperty name='checkerInsert' property='password' value="${param['password']}"/>
			<jsp:setProperty name='checkerInsert' property='name' value="${param['name']}"/>
			<jsp:setProperty name='checkerInsert' property='age' value="${i}"/>
			<jsp:setProperty name='checkerInsert' property='gender' value="${param['gender']}"/>
			<jsp:setProperty name='checkerInsert' property='comments' value="${param['comments']}"/>
			<jsp:setProperty name='checkerInsert' property='address' value="${param['address']}"/>
			<jsp:setProperty name='checkerInsert' property='amigo' value="${param['amigo']}"/>
			
			<c:set var='registration' value="${checkerInsert.registration}"/>
			
			<br>Successful registration!<br>
			
			
			
			
		</c:if>
		
		<c:if test = "${checkLogin eq 'true'}">
			<script>
				alert( 'This e-mail exists!' );
			</script>
			<ul><td>Change this e-mail</td></ul>
		</c:if>
		
	</c:if>
</c:if>

<c:if test = "${param['login'] == null}">
	<ul><td>Enter your data</td></ul>
</c:if>


	
<c:if test = "${!(registration eq 'success')}">
	

	
		<td>
<form id="loginForm" action = '' method = 'post'>
<table border = '1'>
	<div class="field">
	  <tr>
		<td align = 'center'>
		<label>Login(e-mail)</label>
		</td>
		<td align = 'center'>
		<div class="input"><input type = 'text', name = 'login' required='required' 
						pattern="[A-Za-z]{2,}@[A-Za-z]{2,}\.[A-Za-z]{2,}" value="${param['login']}"/></div>
		</td>
	  </tr>
	 </div>
	 
	 <div class="field">
	  <tr>
		<td align = 'center'>
		<label>Name</label>
		</td>
		<td align = 'center'>
		<div class="input"><input type = 'text', name = 'name' value="${param['name']}"/></div>
		</td>
	  </tr>
	 </div>
  
  <div class="field">
	  <tr>
		<td width = '50' align = 'center'>
		<label>Password</label>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'password', name = 'password' pattern="(?=.*[0-9])(?=.*[A-Z]{2,})[0-9a-zA-Z]{8,}"/>
		</td>
	  </tr>
  </div>
  
	<div class="field">
	  <tr>
		<td width = '200' align = 'center' >
		<label>Re-Password</label>
		</td>
		<td width = '200' align = 'center'>
		<input type = 'password', name = 'repassword'/>
		</td>
	  </tr>
	</div>
  
	<div class="field">
	  <tr>
		<td width = '50' align = 'center'>
		<label>Age(12-100)</label>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'number', name = 'age' min="12" max="100" value="${param['age']}"/>
		</td>
	  </tr>
	</div>
	
	<div class="field">
		 <tr>
				<td width = '50' align = 'center'>
				<label>Gender</label>
				</td>
				<td width = '50' align = 'center'>
				F<input type = 'radio', name = 'gender' value='F' ${((param['gender']!=null)&&(param['gender'] eq 'F')) ? 'checked' : ''} /><br>
				M<input type = 'radio', name = 'gender' value='M' ${((param['gender']!=null)&&(param['gender'] eq 'M')) ? 'checked' : ''} />
				</td>
		</tr>
	</div>
  
  <div class="field">
	   <tr>
		<td width = '50' align = 'center'>
		<label>Address</label>
		</td>
		<td width = '50' align = 'center'>
		<select name='address'>
			<option>Choose</option>
			<option value='DNR' ${((param['address']!=null)&&(param['address'] eq 'DNR')) ? 'selected' : ''} >DNR</option>
			<option value='LNR' ${((param['address']!=null)&&(param['address'] eq 'LNR')) ? 'selected' : ''} >LNR</option>
			<option value='Crimea' ${((param['address']!=null)&&(param['address'] eq 'Crimea')) ? 'selected' : ''} >Crimea</option>
		</td>
	  </tr>
  </div>
  
  <div class="field">
	  <tr>
		<td width = '50' align = 'center'>
		<label>Comments</label>
		</td>
		<td width = '50' align = 'center'>
		<textarea name='comments' cols='20' rows='10' >${param['comments']}</textarea>
		</td>
	  </tr>
  </div>
  
  <div class="field">
		<tr>
		<td width = '50' align = 'center'>
		<label>Amigo</label>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'checkbox', name = 'amigo' ${((param['amigo']!=null)) ? 'checked' : ''}/>
		</td>
	  </tr>
  </div>
  
  
  <input type='hidden' name='currentSession' value="${param['currentSession']}" />
		<input type="hidden" name="currentName" value="${param['currentName']}" />
	
 </table>
 <div class="submit">
 <button type="submit">Enter</button>
	   <tr>
		<td width = '50' align = 'center'>
		
		</td>
		<td height='50' width = '50' align = 'center'>
		
		</td>
	  </tr>
	</div>
 </form>
</c:if>
		</td>

 </tr>

 </table>
 
 </center>
 