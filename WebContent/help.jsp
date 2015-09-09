<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	request.setAttribute("pageNow", "help");
%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<div class="main">

	<div class="main-inner">

		<div class="container">

			<div class="row">
				<div class="span12">

					<div class="widget widget-plain">

						<div class="widget-content">

							<a href="javascript:;"
								class="btn btn-large btn-success btn-support-ask">Ask A
								Question</a>


						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->
				</div>
				<!-- /span12 -->
			</div>

			<div class="row">

				<div class="span12">

					<div class="widget">

						<div class="widget-header">
							<i class="icon-pushpin"></i>
							<h3>Sample Frequently Asked Questions</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">

							<h3>Search</h3>

							<br />

							<ol class="faq-list">

								<li>
									<h4>How do I Create my account?</h4>
									<p>Submit your details with your manager ID. your account
										will be created to your email once you have submitted the
										registration form. Your manager has to approve your account.</p>

								</li>

								<li>
									<h4>Manager ID not Listed</h4>
									<p>Your Manager may not have account with this
										Application.You may select Admin as your manager and sent a
										request mail to approve your account with your HCM manager
										approval mail as the attachment.</p>
								</li>

								<li>

									<h4>Can't Login into Application</h4>
									<p>Be sure you have registered your account.if not please register by clicking "Don't have an account?" in right top corner.</p>
									<p>make sure your Manager approved your account.Else remind your manager to approve.</p>
								</li>
							</ol>


						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->

				</div>
				<!-- /spa12 -->

			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /main-inner -->

</div>
<!-- /main -->

<%@ include file="footer.jsp"%>
<script src="js/faq.js"></script>

<script>
	$(function() {
		$('.faq-list').goFaq();
	});
</script>