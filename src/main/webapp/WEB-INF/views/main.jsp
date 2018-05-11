<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- header-section close -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 1700px; margin: auto;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<c:url value='/resources/images/11.JPG'/>" style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>

    <div class="item">
      <img src="<c:url value='/resources/images/12.JPG'/>"style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>
    <div class="item">
      <img src="<c:url value='/resources/images/13.JPG'/>"style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>

  

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
    <!-- service-section start -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="service-img">
                            <a href="#"><img src="<c:url value='/resources/images/5.JPG'/>"></a>
                        </div>
               </div>
            </div>
         </div>
     </div>
    <!-- about-section start -->
    <div class="bg-default space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>Why Choose Our Travel Agency?</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- feature start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="feature-block">
                        <div class="feature-icon"><i class="fa fa-building"></i></div>
                        <div class="feature-content">
                            <h3 class="feature-title">Accommodation</h3>
                            <p>Lorem ipsum dolor sitamet consec tetur adipiscing elied rs tristi quetur etullam corper viver.</p>
                        </div>
                    </div>
                </div>
                <!-- feature close -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="feature-block">
                        <div class="feature-icon"><i class="fa fa-plane"></i></div>
                        <div class="feature-content">
                            <h3 class="feature-title">Transportation</h3>
                            <p>Vivamus tincidunt varius arcu vitaeli ac fringilla nioamile just oetbi once bendum dapibus. </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="feature-block">
                        <div class="feature-icon"><i class="fa fa-star"></i></div>
                        <div class="feature-content">
                            <h3 class="feature-title">Easy Trip Planning</h3>
                            <p>Apretium imperdie is nullam facili sis elit velest blandit ultri ciesras atvar ac ius lorem sitamet velerat. </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about-section close -->
    <!-- Destination-section-start -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>Top Destinations</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- destination-one-start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="destination-img">
                        <a href="#" class="imghover"><img src="resources/images/destination-1.jpg" alt "Tour and Travel Agency - Responsive Website Template" class="img-responsive"></a>
                    </div>
                    <div class="destination-content">
                        <h3><a href="#" class="destination-title">Singapore</a></h3>
                    </div>
                </div>
                <!-- destination-one-close -->
                <!-- destination-two-start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="destination-img imghover">
                        <a href="#" class="imghover"><img src="resources/images/destination-2.jpg" alt "Tour and Travel Agency - Responsive Website Template" class="img-responsive"></a>
                    </div>
                    <div class="destination-content">
                        <h3><a href="#" class="destination-title">Greece</a></h3>
                    </div>
                </div>
                <!-- destination-two-close -->
                <!-- destination-three-start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="destination-img imghover">
                        <a href="#"><img src="resources/images/destination-3.jpg" alt "Tour and Travel Agency - Responsive Website Template" class="img-responsive"></a>
                    </div>
                    <div class="destination-content">
                        <h3><a href="#" class="destination-title">Thailand</a></h3>
                    </div>
                </div>
                <!-- destination-three-close -->
            </div>
        </div>
    </div>
    <!-- Destination-section-close -->
    <!-- Testimonials-section start -->
    <div class="bg-default space-medium">
        <div class="container">
            <div class="row">
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>Our Happy Travelers Reviews</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Testimonials-one-start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="testimonial-block">
                        <div class="testimonial-img"><img src="resources/images/testimonial-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template"></div>
                        <div class="testimonial-user-img"><img src="resources/images/testimonial-user-img-1.jpg" alt="Tour and Travel Agency - Responsive Website Template" class="img-circle"></div>
                        <div class="testimonial-content">
                            <h4>Paul Hasburg</h4>
                            <span class="location">Kerala</span>
                            <div class="rating"> <span> <i class="fa fa-star"></i></span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> </div>
                            <div>
                                <p class="testimonial-text">“I love this tour. We have enough time to fully experience the Kerala. I have the opportunity to show my region, thank you" </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Testimonials-one-close -->
                <!-- Testimonials-two-start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="testimonial-block">
                        <div class="testimonial-img"><img src="resources/images/testimonial-img-2.jpg" alt="Tour and Travel Agency - Responsive Website Template"></div>
                        <div class="testimonial-user-img"><img src="resources/images/testimonial-user-img-2.jpg" alt="Tour and Travel Agency - Responsive Website Template" class="img-circle"></div>
                        <div class="testimonial-content">
                            <h4>Plisa Moody</h4>
                            <span class="location">Kullu-manali</span>
                            <div class="rating"> <span> <i class="fa fa-star"></i></span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> </div>
                            <div>
                                <p class="testimonial-text">“You were an excellent Travel Agency for us! It was invaluable trip to kullu-manali & You considered our unique needs, thank you ”</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Testimonials-two-start -->
                <!-- Testimonials-three-start -->
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="testimonial-block">
                        <div class="testimonial-img"><img src="resources/images/testimonial-img-3.jpg" alt="Tour and Travel Agency - Responsive Website Template"></div>
                        <div class="testimonial-user-img"><img src="resources/images/testimonial-user-img-3.jpg" alt="Tour and Travel Agency - Responsive Website Template" class="img-circle"></div>
                        <div class="testimonial-content">
                            <h4>Christine Smith</h4>
                            <span class="location">Turkey</span>
                            <div class="rating"> <span> <i class="fa fa-star"></i></span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> <span><i class="fa fa-star"></i> </span> </div>
                            <div>
                                <p class="testimonial-text">“Suspendisse vitaea enim dictum fringilla ullam interdum atelit id vestibulum TURKEY aecenas viverra risusit amet quam consectetu, thank you”</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Testimonials-three-close -->
            </div>
        </div>
    </div>
