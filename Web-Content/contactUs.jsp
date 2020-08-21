<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="SemiColonWeb" />

    <!-- Stylesheets -->
    <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" />
    <link rel="stylesheet" href="css/font-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Document Title -->
    <title>Contact Us</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Content -->
      <section>
        <div class="container clearfix">
          <div class="fancy-title title-dotted-border">
            <h3>Send us an Email</h3>
          </div>

          <form
            class="nobottommargin"
            id="template-contactform"
            name="template-contactform"
            action="Contact_Us"
            method="post"
          >
            <div class="col_half">
              <label for="template-contactform-name"
                >Name <small>*</small></label
              >
              <input
                type="text"
                id="template-contactform-name"
                name="name"
                class="sm-form-control required"
                required
              />
            </div>

            <div class="col_half col_last">
              <label for="template-contactform-email"
                >Email <small>*</small></label
              >
              <input
                type="email"
                id="template-contactform-email"
                name="email"
                class="required email sm-form-control"
              />
            </div>

            <div class="clear"></div>

            <div class="col_full">
              <label for="template-contactform-subject"
                >Subject <small>*</small></label
              >
              <input
                type="text"
                id="template-contactform-subject"
                name="subject"
                value=""
                class="required sm-form-control"
                required
              />
            </div>

            <div class="col_full">
              <label for="template-contactform-message"
                >Message <small>*</small></label
              >
              <textarea
                class="required sm-form-control"
                id="contactform-message"
                name="message"
                rows="6"
                cols="30"
                required
              ></textarea>
            </div>

            <span style="color: red;"
              ><%=(request.getAttribute("successmessageContact") == null) ? "" :
              request.getAttribute("successmessageContact")%></span
            >

            <div class="col_full">
              <button
                class="button button-3d nomargin"
                type="submit"
                id="template-contactform"
                name="template-contactform-submit"
                value="submit"
              >
                Send Message
              </button>
            </div>
          </form>
        </div>
      </section>
      <!-- Contact Form & Map Overlay Section End -->
      <!-- Footer -->
      <jsp:include page="footer.jsp" />
    </div>
    <!-- #wrapper end -->

    <!-- Go To Top -->
    <div id="gotoTop" class="icon-angle-up"></div>

    <!-- External JavaScripts -->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>

    <!-- Footer Scripts -->
    <script src="js/functions.js"></script>
  </body>
</html>
