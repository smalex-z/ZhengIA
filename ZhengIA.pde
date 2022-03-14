	import controlP5.*;

  
  // Global variables
  public static boolean mouseDown = false;
  public static String stage = "welcome";
  public static String universalAdminPin = "1234";
  public static int currentUser = -1;
  public static int questionNumber = -1;
  public static int startTime;
  Textfield usernameField,passwordField,confirmPasswordField,adminPasswordField,userAnswerField1,userAnswerField2;
  Textlabel wrongAdminPin, wrongConfirmPassword,wrongInvalidLogin, wrongPasswordLength, timeLabel;
  PImage backImg,group1,group2,urbanaMiddleSchool,award;
  PFont impact,impact45,arial20,arial15;
  JSONArray users,questions;
  ControlP5 gui;

  /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Setup and Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */


  public void settings() {
    // canvas size
    size(1280, 720);
    backImg = loadImage("images/background.png");
    urbanaMiddleSchool = loadImage("images/urbanaMiddleSchool.png");
    group1 = loadImage("images/group1.png");
    group2 = loadImage("images/group2.png");
    award = loadImage("images/award.png");

  }

  public void setup() { 
     
    gui = new ControlP5(this);
    
    impact = createFont("font/impact.otf",256);
    impact45 = createFont("font/impact.otf", 45);
    arial20 = createFont("Arial",20);
    arial15 = createFont("Arial",15);

    users = new JSONArray(); //creates a user object with a ton of user info
    users = loadJSONArray("new.json");

    questions = new JSONArray(); //creates a JSON object with the questions
    
    welcomeGUI(); //open welcomeGUI
  }

  public void draw() {
    noStroke();
    int timeLeft;
    
    if(gui.isMouseOver()){ //If hovering over button, change cursor
      cursor(HAND);
    } else {
      cursor(ARROW);
    }

    int seconds = (millis()/1000);

      
    if(stage.equals("sprintRoundStart")){
      timeLeft = (1200-(seconds - startTime));

      fill(0xFFE3E3E3);
      rect(925,200,250,50);

      fill(color(0,0,0));
      if(timeLeft < 300){
        fill(color(255,0,0));
      }


      textFont(arial20);
      textSize(30);
      
      text("Time Left: " + (((int)timeLeft/60) + ":" + String.format("%02d",(timeLeft - (((int)timeLeft/60)*60)))) ,925,200,250,50);

      if(timeLeft == 0){
        nextButton();
        finishRoundGUI();
      }
      
      delay(5);
    }else if(stage.equals("targetRoundStart")){
      timeLeft = (720-(seconds - startTime));

      fill(0xFFE3E3E3);
      rect(950,200,250,50);

      fill(color(0,0,0));
      if(timeLeft < 120){
        fill(color(255,0,0));
      }

      textFont(arial20);
      textSize(30);
      text("Time Left: " + (((int)timeLeft/60) + ":" + String.format("%02d",(timeLeft - (((int)timeLeft/60)*60)))) ,925,200,250,50);
      
      if(timeLeft == 0){
        nextButton();
        finishRoundGUI();
      }
      
      delay(5);
    }else if(stage.equals("teamRoundStart")){
      timeLeft = (600-(seconds - startTime));

      fill(0xFFE3E3E3);
      rect(925,200,250,50);

      fill(color(0,0,0));
      if(timeLeft < 120){
        fill(color(255,0,0));
      }


      textFont(arial20);
      textSize(30);
      
      text("Time Left: " + (((int)timeLeft/60) + ":" + String.format("%02d",(timeLeft - (((int)timeLeft/60)*60)))) ,925,200,250,50);

      if(timeLeft == 0){
        nextButton();
        finishRoundGUI();
      }
      
      delay(5);
    }
  }

  /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ MISCELLANEOUS ~~~~~~~~~~~~~~~~~~
  ~~~~~~~~~~~~~~~~~ */

  public void clearGui(){ //clear all gui functions like labels and buttons
  
    gui.remove("signUpButton");
    gui.remove("logInButton");
    gui.remove("exitButton");
    gui.remove("Login");
    gui.remove("Sign Up");
    gui.remove("Exit");
    gui.remove("backButton");
    gui.remove("Back");

    gui.remove("username");
    gui.remove("password");
    gui.remove("Confirm Password:");
    gui.remove("confirmPassword");
    gui.remove("USERNAME:");
    gui.remove("PASSWORD:");
    gui.remove("SUBMIT");
    gui.remove("signUpSubmit");
    gui.remove("loginSubmit");
    gui.remove("adminPin");
    gui.remove("Admin Pin:");
    gui.remove("Wrong Admin Pin. Please leave the field blank or input the correct pin");
    gui.remove("Please make your password 6 or more characters long");
    gui.remove("Please ensure that your passwords are the exact same");
    gui.remove("Invalid username or password. Please try again.");
    gui.remove("Sign Out");

    gui.remove("sprintRoundButton");
    gui.remove("Sprint Round");
    gui.remove("targetRoundButton");
    gui.remove("Target Round");
    gui.remove("teamRoundButton");
    gui.remove("Team Round");

    gui.remove("nextButton");
    gui.remove("START");
    gui.remove("NEXT");
    gui.remove("questionTextbox");
    gui.remove("questionTextbox2");
    gui.remove("Invalid answer. Please put in an integer.");

    gui.remove("You have already taken this \nexam! Try a different exam.");


    fill(0xFFE3E3E3); //Cover any previous labels
		rect(400,565,450,50);
  } 