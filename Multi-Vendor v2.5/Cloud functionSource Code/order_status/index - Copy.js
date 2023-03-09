  const functions = require('firebase-functions');
  const admin = require('firebase-admin');
  admin.initializeApp(functions.config().firebase);

  exports.userNotification = functions.firestore.document('orderDetails/{uid}').onWrite(async(event) => {
      let docID = event.after.id;
  
         let status = event.after.get('status');
        let orderId = event.after.get('orderId');
	    let username = event.after.get('userName');
        let shopName = event.after.get('shopName');
		 let driverStatus = event.after.get('driverStatus');
		  let driverName = event.after.get('driverName');
      if (status == 'Placed') {

          let userid = event.after.get('userId');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Order placed successfully" ,
                  "body": "Hi " + username + " your order is placed successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);



          let shopid = event.after.get('shopId');
          let shoptable = 'shop' + shopid;
          let shopDoc = await admin.firestore().doc('shopToken/' + shoptable).get();
          let fcmTokenshop = shopDoc.get('devToken');

          var messageShop = {
              notification: {
                  "title": "Received a New Order" ,
                  "body": "Hi " + shopName + " you have received a new order" ,
                  "sound": "default",
              },

          };
           await admin.messaging().sendToDevice(fcmTokenshop, messageShop);



          
           let shopDoc1 = await admin.firestore().doc('shopTokenWeb/' + shoptable).get();
           let fcmTokenshop1 = shopDoc1.get('devToken');
 
           var messageShop1 = {
               notification: {
                   "title": "Received a New Order" ,
                   "body": "Hi " + shopName + " you have received a new order" ,
                   "sound": "default",
               },
 
           };
            await admin.messaging().sendToDevice(fcmTokenshop1, messageShop1);

          
           let shopDoc2 = await admin.firestore().doc('adminToken/admin1').get();
           let fcmTokenshop2 = shopDoc1.get('devToken');
 
           var messageShop2 = {
               notification: {
                   "title": "Received a New Order" ,
                   "body": "Hi " + shopName + " shop has received a new order" ,
                   "sound": "default",
               },
 
           };
            await admin.messaging().sendToDevice(fcmTokenshop2, messageShop2);

          
           let shopDoc3 = await admin.firestore().doc('adminTokenWeb/admin1').get();
           let fcmTokenshop3 = shopDoc1.get('devToken');
 
           var messageShop3 = {
               notification: {
                   "title": "Received a New Order" ,
                   "body": "Hi " + shopName + " shop has received a new order" ,
                   "sound": "default",
               },
 
           };
            await admin.messaging().sendToDevice(fcmTokenshop3, messageShop3);

          

      } else if(status == 'Accepted'){
		  
		   let userid = event.after.get('userId');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Order Accepted successfully" ,
                  "body": "Hi " + username + " your order is accepted successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		   console.log('token');
		  console.log(fcmToken);
		  
	  } else if(status == 'Packed'){
		  
		   let userid = event.after.get('userId');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Order Packed successfully" ,
                  "body": "Hi " + username + " your order is packed successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  } else if(status == 'Completed'){
		  
		   let userid = event.after.get('userId');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Order Delivered successfully" ,
                  "body": "Hi " + username + " your order is delivered successfully" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  }else if(driverStatus == 'Accepted' && status == 'Shipped'){
		  
		   let userid = event.after.get('userId');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Order Shipped successfully" ,
                  "body": "Hi " + username + " your order is assigned to "+  driverName +" driver" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  }else if(driverStatus == 'Pickuped' && status == 'Shipped'){
		  
		   let userid = event.after.get('userId');
          let table = 'user' + userid;
          let userDoc = await admin.firestore().doc('devToken/' + table).get();
          let fcmToken = userDoc.get('devToken');

          var message = {
              notification: {
                  "title": "Order Shipped successfully" ,
                  "body": "Hi " + username + " your order is pickuped by "+  driverName +" driver" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  }else if(driverStatus == 'Waiting' && status == 'RShipped'){
		  
		   let driverId = event.after.get('driverId');
          let table = 'driver' + driverId;
          let userDoc = await admin.firestore().doc('driverToken/' + table).get();
          let fcmToken = userDoc.get('Token');

          var message = {
              notification: {
                  "title": "New Request" ,
                  "body": "Hi " + driverName + " your have a assigned a new order" ,
                  "sound": "default",
              },

          };
          const response = await admin.messaging().sendToDevice(fcmToken, message);
		  
	  }

      console.log('Notification sent successfully');
 
  });