<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://www.gstatic.com/firebasejs/5.5.5/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.5.5/firebase-firestore.js"></script>
<title>Fire Store</title>
</head>
<body>
	<h1 id="hotDogOutput">Hot dog status:</h1>
	<input type="textfield" id="latesHotDogStatus"/>
	<button id="saveButton">Save</button>
	<div id="get-status"></div>
	<button id="editButton">Edit</button>
<script>
	var config = {
		apiKey : "AIzaSyB6Y4LfqpiWjjbIFL9AAX4qQ2YheXKct4I",
		authDomain : "websitegae-218105.firebaseapp.com",
		databaseURL : "https://user.firebaseio.com",
		projectId : "websitegae-218105",
		storageBucket : "websitegae-218105.appspot.com",
		messagingSenderId : "564071622405",
	};
	firebase.initializeApp(config);
	var firestore = firebase.firestore();
	firestore.settings({
		  timestampsInSnapshots: true
		});
	const docRef = firestore.doc("samples/sandwitchData");
	const outputHeader = document.querySelector("#hotDogOutput");
	const inputTextField = document.querySelector("#latesHotDogStatus");
	const saveBtn = document.querySelector("#saveButton");

	const textToEdit = null;
	docRef.get().then(function(doc) {
		hotDogstatus: textToEdit
	    if (doc.exists) {
	        console.log("Document data:", doc.data());
	        document.getElementById("get-status").value = doc.data().hotDogstatus;
	    } else {
	        // doc.data() will be undefined in this case
	        console.log("No such document!");
	    }
	}).catch(function(error) {
	    console.log("Error getting document:", error);
	});
	
	
	
	saveBtn.addEventListener("click", function(){
		const textToSave = inputTextField.value;
        console.log("I am going to save " + textToSave + "to Firesore");
        docRef.set({
        	hotDogstatus: textToSave
        }).then(function(){
        	console.log("status save!");
        }).catch(function(error){
        	console.log("Got an error", error);
        });
	})
	
	/* const editBtn = document.querySelector("#editButton");
	editBtn.addEventListener("click", function(){
		
	}) */
</script>
</body>
</html>