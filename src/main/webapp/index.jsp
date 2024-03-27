<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up & Sign In Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="index_style.css">
</head>
<body>
<div class="wrapper">
    <div class="typing-demo">
      Welcome to FileBoxx
    </div>
</div>
   
 <div class="container">
    <div class="sign-prompt">
    </div>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" id="signup-tab" data-toggle="tab" href="#signup" role="tab" aria-controls="signup" aria-selected="true">Sign Up</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="signin-tab" data-toggle="tab" href="#signin" role="tab" aria-controls="signin" aria-selected="false">Sign In</a>
      </li>
    </ul>
    <div class="tab-content" id="myTabContent">
      <!-- Sign Up Tab Pane -->
      <div class="tab-pane fade show active" id="signup" role="tabpanel" aria-labelledby="signup-tab">
        <form id="signup-form" method="post" action="RegisterServlet">
          <div class="form-group">
            <label for="signup-name">Name</label>
            <input type="text" class="form-control" name="signup-name" id="signup-name" placeholder="Enter your name" required>
          </div>
          <div class="form-group">
            <label for="signup-email">E-Mail Address</label>
            <input type="email" class="form-control" name="signup-email" id="signup-email" placeholder="Enter your email" required>
          </div>
          <div class="form-group">
            <label for="signup-password">Password</label>
            <input type="password" class="form-control" id="signup-password" name="signup-password" placeholder="Enter your password" required>
          </div>
          <div class="form-group">
            <label for="signup-confirm-password">Confirm Password</label>
            <input type="password" class="form-control" id="signup-confirm-password" name="signup-confirm-password" placeholder="Confirm your password" required>
          </div>
<div class="wrapper2">
    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
    <label for="agree-term" class="label-agree-term">
        <span><span></span></span>
        <p>I agree to all statements in <a href="#" class="term-service">Terms of service</a></p>
    </label>
</div>

          <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
      </div>
      <!-- Sign In Tab Pane -->
      <div class="tab-pane fade" id="signin" role="tabpanel" aria-labelledby="signin-tab">
        <form id="signin-form">
          <div class="form-group">
            <label for="signin-email">Email address</label>
            <input type="email" class="form-control" id="signin-email" name="signin-email" placeholder="Enter your email" required>
          </div>
          <div class="form-group">
            <label for="signin-password">Password</label>
            <input type="password" class="form-control" id="signin-password" name="signin-password" placeholder="Enter your password" required>
          </div>
          <button type="submit" class="btn btn-primary">Sign In</button>
        </form>
      </div>
    </div>
  </div>
  <div class="wavetag">
<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
<defs>
<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
</defs>
<g class="parallax">
<use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
<use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
</g>
</svg>
</div>

  <!-- Bootstrap JS (mandatory for tabs) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
