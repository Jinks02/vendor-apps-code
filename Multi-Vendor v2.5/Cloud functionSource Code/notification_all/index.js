  const functions = require('firebase-functions');
  const admin = require('firebase-admin');
  admin.initializeApp(functions.config().firebase);

  exports.notificationall = functions.firestore.document('notificationall/{uid}').onWrite(async(event) => {


      // let message = event.after.get('message');
      let title = event.after.get('title');
      let subtitle = event.after.get('subtitle');
      let type = event.after.get('usertype');
	  let image = event.after.get('image');
      if (type == 'User') {


          await admin.firestore().collection('devToken').get().then((querySnapshot) => {
              querySnapshot.docs.forEach((doc) => {

                  let fcmToken = doc.data().devToken;

                  console.log(fcmToken);
				  if(image=='no'){
					  var message = {
                      notification: {
                          "title": title,
                          "body": subtitle,
                          "sound": "mysound",
                      },

                    }; 
				  } else {
                  var message = {
                      notification: {
                          "title": title,
                          "body": subtitle,
                          "sound": "mysound",
                          "image": image
                      },

                   };
				 }
                  const response = admin.messaging().sendToDevice(fcmToken, message);

              });
              console.log(tempDoc)
          });




      } else   if (type == 'Driver') {


            await admin.firestore().collection('driverToken').get().then((querySnapshot) => {
                querySnapshot.docs.forEach((doc) => {
  
                    let fcmToken = doc.data().Token;
  
                    console.log(fcmToken);
                    if(image=='no'){
                        var message = {
                        notification: {
                            "title": title,
                            "body": subtitle,
                            "sound": "mysound",
                        },
  
                      }; 
                    } else {
                    var message = {
                        notification: {
                            "title": title,
                            "body": subtitle,
                            "sound": "mysound",
                            "image": image
                        },
  
                     };
                   }
                    const response = admin.messaging().sendToDevice(fcmToken, message);
  
                });
                console.log(tempDoc)
            });
  
  
  
  
        } else   if (type == 'Vendor') {


            await admin.firestore().collection('shopToken').get().then((querySnapshot) => {
                querySnapshot.docs.forEach((doc) => {
  
                    let fcmToken = doc.data().devToken;
  
                    console.log(fcmToken);
                    if(image=='no'){
                        var message = {
                        notification: {
                            "title": title,
                            "body": subtitle,
                            "sound": "mysound",
                        },
  
                      }; 
                    } else {
                    var message = {
                        notification: {
                            "title": title,
                            "body": subtitle,
                            "sound": "mysound",
                            "image": image
                        },
  
                     };
                   }
                    const response = admin.messaging().sendToDevice(fcmToken, message);
  
                });
                console.log(tempDoc)
            });


            await admin.firestore().collection('shopTokenWeb').get().then((querySnapshot) => {
                querySnapshot.docs.forEach((doc) => {
  
                    let fcmToken = doc.data().devToken;
  
                    console.log(fcmToken);
                    if(image=='no'){
                        var message = {
                        notification: {
                            "title": title,
                            "body": subtitle,
                            "sound": "mysound",
                        },
  
                      }; 
                    } else {
                    var message = {
                        notification: {
                            "title": title,
                            "body": subtitle,
                            "sound": "mysound",
                            "image": image
                        },
  
                     };
                   }
                    const response = admin.messaging().sendToDevice(fcmToken, message);
  
                });
                console.log(tempDoc)
            });
  
  
  
  
        }
      
      console.log('Notification sent successfully');

  });