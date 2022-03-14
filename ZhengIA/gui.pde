/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GUI SETTINGS AND SETUP ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

  public void welcomeGUI(){ //welcome page GUI, first page to show up
    clear();
    clearGui();
    
    //Background && UI
    background(backImg);
    stroke(2);
    image(urbanaMiddleSchool,15,170,400,250);
    image(group1,440,210,400,300);
    image(group2,15,440,400,250);
    image(award,865,170,400,530);
    noStroke();

    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);
    textAlign(LEFT,TOP);
    textSize(30);
    fill(0xFFCCCCCC);
    text("Get Ready for the MATHCOUNTS Competition!", 20,70);
    textFont(arial20);
    fill(0xFF000000);
    text("The Urbana Competition will be hosted online at Urbana Middle School! Hit the Sign Up button to get started!", 20,100);
    
    //buttons
    gui.addButton("signUpButton").setPosition(1015,12.5).setSize(100,50).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addButton("logInButton").setPosition(1150,12.5).setSize(100,50).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    gui.addLabel("Sign Up").setPosition(1020,25).setSize(100,50).setFont(arial20);
    gui.addLabel("Login").setPosition(1170,25).setSize(100,50).setFont(arial20);  
  }

  public void loginGUI(){  
    clear();
    clearGui();

    //Banner and Background
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    gui.addButton("backButton").setPosition(1070,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Back").setPosition(1085,85).setSize(80,40).setFont(arial20);

    //Login Specific
    fill(0xFFE3E3E3);
    rect(100,170,1080,550);
    fill(0xFF000080);
    rect(100,170,1080,10);
    textAlign(LEFT,TOP);
    textSize(50);
    text("LOGIN-", 105,175);
    textSize(15);
    fill(0xFF000000);
    text("Sign into your account here!", 105,230);
    
    fill(0xFF000000);
    usernameField = gui.addTextfield("username").setPosition(440, 330).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
    passwordField = gui.addTextfield("password").setPosition(440, 405).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
    gui.addBang("loginSubmit").setPosition(580, 630).setSize(120, 40).setLabel(""); 
    gui.addLabel("USERNAME:").setPosition(310,330).setSize(80,40).setFont(arial20).setColor(color(0,0,0));
    gui.addLabel("PASSWORD:").setPosition(310,405).setSize(80,40).setFont(arial20).setColor(color(0,0,0));
    gui.addLabel("SUBMIT").setPosition(600,635).setSize(120,40).setFont(arial20).setColor(color(0,0,0));
  }

  public void signupGUI(){
    clear();
    clearGui();
    
    //Banner and Background
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    gui.addButton("backButton").setPosition(1070,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Back").setPosition(1085,85).setSize(80,40).setFont(arial20);

    //Sign up Specific
    fill(0xFFE3E3E3);
    rect(100,170,1080,550);
    fill(0xFF000080);
    rect(100,170,1080,10);
    textAlign(LEFT,TOP);
    textSize(50);
    text("SIGN UP-", 105,175);
    textSize(15);
    fill(0xFF000000);
    text("You can create your account here! Make sure your password is at least 6 characters long, and if you are an admin, input the given pin. If you are not an admin, leave it blank.", 105,230);
    
    fill(0xFF000000);
    usernameField = gui.addTextfield("username").setPosition(440, 280).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
    passwordField = gui.addTextfield("password").setPosition(440, 355).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
    confirmPasswordField = gui.addTextfield("confirmPassword").setPosition(440, 430).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
    adminPasswordField = gui.addTextfield("adminPin").setPosition(440, 505).setSize(200, 40).setAutoClear(false).setFont(arial20).setLabel("");
    gui.addBang("signUpSubmit").setPosition(580, 630).setSize(120, 40).setLabel(""); 
    gui.addLabel("USERNAME:").setPosition(310,280).setSize(80,40).setFont(arial20).setColor(color(0,0,0));
    gui.addLabel("PASSWORD:").setPosition(310,355).setSize(80,40).setFont(arial20).setColor(color(0,0,0));
    gui.addLabel("Confirm Password:").setPosition(265,430).setSize(80,40).setFont(arial20).setColor(color(0,0,0));
    gui.addLabel("Admin Pin:").setPosition(335,505).setSize(30,40).setFont(arial20).setColor(color(0,0,0));
    gui.addLabel("SUBMIT").setPosition(600,635).setSize(120,40).setFont(arial20).setColor(color(0,0,0));
    
  }

  public void adminMainGUI(){ //Admin page GUI, main page/hub for admins
    clear();
    clearGui();
    
    //Background && UI
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);
    
    //buttons
    gui.addButton("signUpButton").setPosition(1150,12.5).setSize(100,50).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    gui.addLabel("Sign Out").setPosition(1155,25).setSize(100,50).setFont(arial20);
  }

  public void userMainGUI(){ //Non-Admin user main page GUI, hub to questions
    clear();
    clearGui();
    
    //Background && UI
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);

    //non-admin main page specifics
    textFont(arial15);
    fill(0xFFE3E3E3);
    rect(60,170,1160,550);
    fill(0xFF000080);
    rect(60,170,1160,10);

    textSize(25);
    textAlign(LEFT,TOP);
    fill(0xFF000000);
    text("Choose one of the following buttons below to get started on your test! We recommend that you start \nwith the sprint round before moving onto the target and team rounds!", 105,200);
    textSize(15);
    text("The Sprint Round consists of 15 questions taken across 20 minutes! This section is Non-calculator, and each question is worth 1 point.", 90,445,270,400);
    text("The Target Round consists of 2 rounds of 2 questions. You have 12 minutes for the questions. This section is calculator enabled, and each question is worth 2 points.", 505,445,270,400);
    text("In the Team Round, 4 members will work together on 5 problems for 10 minutes with calculators. Only the team captain may input answers. This section is scored seperately from the Sprint and Target Rounds. This section is scored by taking the average score of the team members and adding 2pts for every correct team round answer.", 920,445,270,400);


    gui.addButton("sprintRoundButton").setPosition(100,300).setSize(250,100).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(255,127,39)).setLabel("");
    gui.addButton("targetRoundButton").setPosition(515,300).setSize(250,100).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(255,127,39)).setLabel("");
    gui.addButton("teamRoundButton").setPosition(930,300).setSize(250,100).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(255,127,39)).setLabel("");
    gui.addLabel("Sprint Round").setPosition(115,325).setSize(250,100).setFont(impact45).setColor(color(0,0,0));
    gui.addLabel("Target Round").setPosition(530,325).setSize(250,100).setFont(impact45).setColor(color(0,0,0));
    gui.addLabel("Team Round").setPosition(945,325).setSize(250,100).setFont(impact45).setColor(color(0,0,0));
    
    
    //buttons
    gui.addButton("signUpButton").setPosition(1150,12.5).setSize(100,50).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    gui.addLabel("Sign Out").setPosition(1155,25).setSize(100,50).setFont(arial20);
  }

  public void preRoundGUI(){ //Pre-Round GUI
    clear();
    clearGui();
    
    //Background && UI
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);

    //Sprint Round GUI
    fill(0xFFE3E3E3);
    rect(100,170,1080,550);
    fill(0xFF000080);
    rect(100,170,1080,10);
    textAlign(LEFT,TOP);
    textSize(50);

    if(stage.equals("sprintRound")){
      text("Sprint Round-", 105,175);
      textFont(arial20);
      textSize(20);
      fill(0xFF000000);
      text("The Sprint Round consists of 15 questions taken across 20 minutes! You are not allowed to use calculators, books or other aids during this round. Calculations may be done on scratch paper. All answers must be complete, legible and simplified to lowest terms. Record only final answers in the blanks in the textbox above the submit button. If you complete the problems before time is called, use the remaining time to check your answers. In each written round of the competition, the required unit for the answer is included in the answer blank. The plural form of the unit is always used, even if the answer appears to require the singular form of the unit. The unit provided in the answer blank is the only form of the answer that will be accepted.\n\nEach question is worth 1 point. Once you are ready, hit the start button and your 20 minute timer will start.", 125,250,1030,470);
    }else if(stage.equals("targetRound")){
      text("Target Round-", 105,175);
      textFont(arial20);
      textSize(20);
      fill(0xFF000000);
      text("This section of the competition consists of 4 problems, which will be presented in pairs. You have 12 minutes to complete the 4 questions. When told to do so, hit the next button below and begin working. This round assumes the use of calculators, and calculations also may be done on scratch paper, but no other aids are allowed. All answers must be complete, legible and simplified to lowest terms. Record only final answers in the blanks in the lefthand column of the problem sheets. If you complete the problems before time is called, use the time remaining to check your answers. Once you are ready, hit the start button and your 12 minute timer will start.", 125,250,1030,470);

    }else if(stage.equals("teamRound")){
      text("Target Round-", 105,175);
      textFont(arial20);
      textSize(20);
      fill(0xFF000000);
      text("Once you are ready, hit the start button and your 6 minute timer will start.", 125,250,1030,470);

    }

    gui.addBang("nextButton").setPosition(580, 630).setSize(120, 40).setLabel(""); 
    gui.addLabel("START").setPosition(600,635).setSize(120,40).setFont(arial20).setColor(color(0,0,0));

    //buttons
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    
  }

  public void questionsGUI(){ //GUI for the Questions
    clear();
    clearGui();
    
    //Background && UI
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);

    //Sprint Round GUI
    fill(0xFFE3E3E3);
    rect(100,170,1080,550);
    fill(0xFF000080);
    rect(100,170,1080,10);
    textAlign(LEFT,TOP);
    textSize(50);
    
    if(stage.equals("sprintRound")||stage.equals("sprintRoundStart")){
      text("Sprint Round-", 105,175);
      gui.addBang("nextButton").setPosition(580, 630).setSize(120, 40).setLabel(""); 
      gui.addLabel("NEXT").setPosition(610,635).setSize(120,40).setFont(arial20).setColor(color(0,0,0));
      userAnswerField1 = gui.addTextfield("questionTextbox").setPosition(440, 330).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
    
    }else if(stage.equals("targetRound")||stage.equals("targetRoundStart")){
      text("Target Round-", 105,175);
      gui.addBang("nextButton").setPosition(580, 630).setSize(120, 40).setLabel(""); 
      gui.addLabel("NEXT").setPosition(610,635).setSize(120,40).setFont(arial20).setColor(color(0,0,0));
      userAnswerField1 = gui.addTextfield("questionTextbox").setPosition(440, 340).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");
      userAnswerField2 = gui.addTextfield("questionTextbox2").setPosition(440, 490).setSize(400, 40).setAutoClear(false).setFont(arial20).setLabel("");

    }else if(stage.equals("teamRound")||stage.equals("teamRoundStart")){

    }

    //buttons
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);

    
  }

 public void finishRoundGUI(){  
    clear();
    clearGui();
    questionNumber = -1;
    

    //Banner and Background
    background(backImg);
    fill(0xFF674ea7);
    rect(0,0,1280,75);
    fill(0xb43b5dc5);
    rect(0,75,1280,50);
    fill(0xFFFFFFFF);

    textFont(impact);
    textSize(80);
    textAlign(LEFT,BOTTOM);
    text("MATHCOUNTS", 20,80);
    
    textFont(arial20);
    textSize(20);
    fill(0xFF000000);
    text("You have finished this round of testing! Your score will be automatically graded. Click the \"Back\" button to \ncontinue back to the main screen.", 125,300);
    gui.addButton("exitButton").setPosition(1170,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Exit").setPosition(1190,85).setSize(80,40).setFont(arial20);
    gui.addButton("backButton").setPosition(1070,80).setSize(80,40).activateBy(ControlP5.RELEASE).setColorBackground(color(#ffff9900)).setColorForeground(color(#ffe58f0e)).setColorActive(color(#ffff9900)).setLabel("");
    gui.addLabel("Back").setPosition(1085,85).setSize(80,40).setFont(arial20);
    
  }


  