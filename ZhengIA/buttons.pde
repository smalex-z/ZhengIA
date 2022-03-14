/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BUTTON LOGIC AND METHODS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

  public void signUpButton(int value){
		if(currentUser == -1){ //Sign Up Functionality
			stage = "signup";
			signupGUI(); //Set the sign-up page GUI
	  	}else{ //Sign Out Functionality
			currentUser = -1; 
			welcomeGUI();
	  	}
  }

  public void logInButton(int value){
	stage = "signup";
	loginGUI();
  }

  public void backButton(int value){
	if (currentUser == -1){
		stage = "welcome";
		welcomeGUI();
	}else{
		stage = "userMain";
		userMainGUI();
	}
  }

  public void exitButton(int value){ //exit
		System.exit(0);    
  }

  public void signUpSubmit(int value) { //submit button for signup
		String username, password, checkPassword,adminPassword;
		
		username = usernameField.getText();
		password = passwordField.getText();
		checkPassword = confirmPasswordField.getText();
		adminPassword = adminPasswordField.getText();
		
		fill(0xFFE3E3E3);
		rect(400,565,450,50);

		gui.remove("Wrong Admin Pin. Please leave the field blank or input the correct pin");
		gui.remove("Please make your password 6 or more characters long");
		gui.remove("Please ensure that your passwords are the exact same");

		if(password.equals(checkPassword)){  // Make sure passwords are correct, over 6 characters, + if admin pin is correct
			if(password.length() >= 6){
			if(adminPassword.equals(universalAdminPin) || adminPassword.equals("")){
				stage = "welcome";
				JSONObject userInfo = new JSONObject();
				
				userInfo.setString("Username", username);
				userInfo.setString("Password", password);
				if(adminPassword.equals(universalAdminPin)){ //Admin Pin is correct
				userInfo.setBoolean("Admin", true);
				}else{  //Admin Pin is empty (Regular Account)
				userInfo.setBoolean("Admin", false);
				}
				userInfo.setInt("sprintScore",-1);
				userInfo.setInt("targetScore",-1);
				userInfo.setInt("teamScore",-1);
				users.setJSONObject(users.size(), userInfo);
				saveJSONArray(users, "/data/new.json");

				welcomeGUI();
			}else{ //wrong pin
				gui.addLabel("Wrong Admin Pin. Please leave the field blank or input the correct pin").setPosition(440,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
			}
			}else{
			gui.addLabel("Please make your password 6 or more characters long").setPosition(440,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
			}
		}else{
			gui.addLabel("Please ensure that your passwords are the exact same").setPosition(440,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
		}
  } 

  public void loginSubmit(int value) { //submit button for login 
		String username, password;
		boolean successful = false;
		username = usernameField.getText();
		password = passwordField.getText();

		fill(0xFFE3E3E3); //Cover any previous labels
		rect(400,565,450,50);

		gui.remove("Invalid username or password. Please try again.");
		users = loadJSONArray("new.json");
		
		for (int i = 0; i < users.size(); i++) {
			JSONObject userInfo = users.getJSONObject(i);
			if(userInfo.getString("Username").equals(username) && userInfo.getString("Password").equals(password)){
				successful = true;
				currentUser = i;
				if(userInfo.getBoolean("Admin") == true){
					stage = "adminMain";
					adminMainGUI();
				}else if(userInfo.getBoolean("Admin") == false){
					stage = "userMain";
					userMainGUI();
				}
			}
		}
		if(successful == false){
			gui.addLabel("Invalid username or password. Please try again.").setPosition(440,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
		}
  }

public void sprintRoundButton() { //button to activate sprint round
	JSONObject userInfo = users.getJSONObject(currentUser);


	if(userInfo.getInt("sprintScore") == -1){ //Havent started yet
		stage = "sprintRound";
		preRoundGUI();
	}else{
		gui.addLabel("You have already taken this \nexam! Try a different exam.").setPosition(100,400).setSize(80,40).setFont(arial20).setColor(color(255,0,0));
	}
}

public void targetRoundButton() { //button to activate target round
	JSONObject userInfo = users.getJSONObject(currentUser);


	if(userInfo.getInt("targetScore") == -1){ //Havent started yet
		stage = "targetRound";
		preRoundGUI();
	}else{
		gui.addLabel("You have already taken this \nexam! Try a different exam.").setPosition(515,400).setSize(80,40).setFont(arial20).setColor(color(255,0,0));
	}
}

public void teamRoundButton() { //button to activate team round
	JSONObject userInfo = users.getJSONObject(currentUser);


	if(userInfo.getInt("teamScore") == -1){ //Havent started yet
		stage = "teamRound";
		preRoundGUI();
	}else{
		gui.addLabel("You have already taken this \nexam! Try a different exam.").setPosition(930,400).setSize(80,40).setFont(arial20).setColor(color(255,0,0));
	}
}

public void nextButton() { //button to move to next questions
	System.out.println(stage);
	System.out.println("QuestionNum " +questionNumber);
  
	if(stage.equals("sprintRound") || stage.equals("sprintRoundStart")){
		questions = loadJSONArray("sprintQuestions.json");
		
		if(questionNumber == -1){
			JSONObject userInfo = users.getJSONObject(currentUser);

			questionsGUI();
			
			stage = "sprintRoundStart";
			startTime = (millis()/1000);
			userInfo.setInt("sprintScore", 0);
			questionNumber = 0;

			JSONObject questionInfo = questions.getJSONObject(questionNumber);
			textFont(arial20);
			textSize(20);
			fill(0xFF000000);
			text(questionInfo.getString("Question"),125,250,1030,470);

		}else{
			JSONObject questionInfo = questions.getJSONObject(questionNumber);
			JSONObject userInfo = users.getJSONObject(currentUser);

			try {  
				Integer.parseInt(userAnswerField1.getText());  
			} catch(NumberFormatException e){  
				gui.addLabel("Invalid answer. Please put in an integer.").setPosition(480,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
				return;
			}  
			gui.remove("Invalid answer. Please put in an integer.");

			int correctAnswer = Integer.valueOf(userAnswerField1.getText());

			if(questionInfo.getInt("Answer") == correctAnswer){
				userInfo.setInt("sprintScore", (userInfo.getInt("sprintScore")+1));

				System.out.println("Correct Answer");
				users.setJSONObject(currentUser, userInfo);
				saveJSONArray(users, "/data/new.json");
			}

			if(questionNumber !=14){
				questionNumber++;
				questionInfo = questions.getJSONObject(questionNumber);

				questionsGUI();
				textFont(arial20);
				textSize(20);
				fill(0xFF000000);
				text(questionInfo.getString("Question"),125,250,1030,470);

			}else if(questionNumber == 14){
				questionNumber++;
				
				stage = "stageFinished";
				finishRoundGUI();
			}	
		}			
	}else if(stage.equals("targetRound") || stage.equals("targetRoundStart")){
		questions = loadJSONArray("targetQuestions.json");
		
		if(questionNumber == -1){
			JSONObject userInfo = users.getJSONObject(currentUser);

			questionsGUI();
			
			stage = "targetRoundStart";
			startTime = (millis()/1000);
			userInfo.setInt("targetScore", 0);
			questionNumber = 0;

			JSONObject questionInfo1 = questions.getJSONObject(questionNumber);
			JSONObject questionInfo2 = questions.getJSONObject((questionNumber+1));

			textFont(arial20);
			textSize(20);
			fill(0xFF000000);
			text(questionInfo1.getString("Question"),125,250,1030,470);
			text(questionInfo2.getString("Question"),125,400,1030,470);


		}else{
			JSONObject questionInfo1 = questions.getJSONObject(questionNumber);
			JSONObject questionInfo2 = questions.getJSONObject((questionNumber+1));
			JSONObject userInfo = users.getJSONObject(currentUser);

			try {  
				Integer.parseInt(userAnswerField1.getText());  
			} catch(NumberFormatException e){  
				gui.addLabel("Invalid answer. Please put in an integer.").setPosition(480,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
				return;
			}  

			try {  
				Integer.parseInt(userAnswerField2.getText());  
			} catch(NumberFormatException e){  
				gui.addLabel("Invalid answer. Please put in an integer.").setPosition(480,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
				return;
			}  

			gui.remove("Invalid answer. Please put in an integer.");

			int correctAnswer = Integer.valueOf(userAnswerField1.getText());

			if(questionInfo1.getInt("Answer") == correctAnswer){
				userInfo.setInt("targetScore", (userInfo.getInt("targetScore")+2));

				System.out.println("Correct Answer");
				users.setJSONObject(currentUser, userInfo);
				saveJSONArray(users, "/data/new.json");
			}
			
			correctAnswer = Integer.valueOf(userAnswerField2.getText());

			if(questionInfo2.getInt("Answer") == correctAnswer){
				userInfo.setInt("targetScore", (userInfo.getInt("targetScore")+2));

				System.out.println("Correct Answer");
				users.setJSONObject(currentUser, userInfo);
				saveJSONArray(users, "/data/new.json");
			}

			if(questionNumber != 2){
				questionNumber++;
				questionNumber++;
				questionInfo1 = questions.getJSONObject(questionNumber);
				questionInfo2 = questions.getJSONObject((questionNumber+1));

				questionsGUI();
				textFont(arial20);
				textSize(20);
				fill(0xFF000000);
				text(questionInfo1.getString("Question"),125,250,1030,470);
				text(questionInfo2.getString("Question"),125,400,1030,470);
			
			}else if(questionNumber == 2){
			questionNumber++;
			stage = "stageFinished";
			finishRoundGUI();

			}
		}
	}else if(stage.equals("teamRound")){
		questions = loadJSONArray("sprintQuestions.json");
		
		if(questionNumber == -1){
			JSONObject userInfo = users.getJSONObject(currentUser);

			questionsGUI();
			
			stage = "teamRoundStart";
			startTime = (millis()/1000);
			userInfo.setInt("teamScore", 0);
			questionNumber = 0;

			JSONObject questionInfo = questions.getJSONObject(questionNumber);
			textFont(arial20);
			textSize(20);
			fill(0xFF000000);
			text(questionInfo.getString("Question"),125,250,1030,470);

		}else{
			JSONObject questionInfo = questions.getJSONObject(questionNumber);
			JSONObject userInfo = users.getJSONObject(currentUser);

			try {  
				Integer.parseInt(userAnswerField1.getText());  
			} catch(NumberFormatException e){  
				gui.addLabel("Invalid answer. Please put in an integer.").setPosition(480,575).setSize(80,40).setFont(arial15).setColor(color(255,0,0));
				return;
			}  
			gui.remove("Invalid answer. Please put in an integer.");

			int correctAnswer = Integer.valueOf(userAnswerField1.getText());

			if(questionInfo.getInt("Answer") == correctAnswer){
				userInfo.setInt("teamScore", (userInfo.getInt("teamScore")+1));

				System.out.println("Correct Answer");
				users.setJSONObject(currentUser, userInfo);
				saveJSONArray(users, "/data/new.json");
			}

			if(questionNumber !=14){
				questionNumber++;
				questionInfo = questions.getJSONObject(questionNumber);

				questionsGUI();
				textFont(arial20);
				textSize(20);
				fill(0xFF000000);
				text(questionInfo.getString("Question"),125,250,1030,470);

			}else if(questionNumber == 14){
				questionNumber++;
				
				stage = "stageFinished";
				finishRoundGUI();
			}	
		}				}
	
}
 
