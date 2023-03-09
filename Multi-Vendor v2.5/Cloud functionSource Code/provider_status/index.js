  const functions = require('firebase-functions');
  const admin = require('firebase-admin');
  admin.initializeApp(functions.config().firebase);

  exports.providerNotification = functions.firestore.document('HService/{uid}').onWrite(async(event) => {
      let docID = event.after.id;
  
         let status = event.after.get('status');
        let orderId = event.after.get('bookId');
	    let username = event.after.get('username');
        let providerName = event.after.get('providerName');
      if (status == 'pending') {

          let userid = event.after.get('userid');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Requested successfully" ,
                  "body": "Hi " + username + " your service is requested successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);



          let providerId = event.after.get('providerId');
          let providertable = 'provider' + providerId;
          let shopDoc = await admin.firestore().doc('providerToken/' + providertable).get();
          let fcmTokenshop = shopDoc.get('Token');

          var messageShop = {
              notification: {
                  "title": "Received a New Request" ,
                  "body": "Hi " + providerName + " you have received a request" ,
                  "sound": "default",
              },

          };
           await admin.messaging().sendToDevice(fcmTokenshop, messageShop);


          

      } else if(status == 'accepted'){
		  
		  let userid = event.after.get('userid');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Request Accepted successfully" ,
                  "body": "Hi " + username + " your request is accepted successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		   console.log('token');
		  console.log(fcmToken);
		  
	  } else if(status == 'ontheway'){
		  let userid = event.after.get('userid');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');


          var message = {
              notification: {
                  "title": "On The Way" ,
                  "body": "Hi " + username + " your provider has On the way" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  } else if(status == 'processing'){
		  
		   let userid = event.after.get('userid');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');
          
          var message = {
              notification: {
                  "title": "started successfully" ,
                  "body": "Hi " + username + " your work started successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  }else if(status == 'Success'){
          
		    let userid = event.after.get('userid');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');
          
          var message = {
              notification: {
                  "title": "Completed successfully" ,
                  "body": "Hi " + username + " your request is completed successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  }
      console.log('Notification sent successfully');
 
  });