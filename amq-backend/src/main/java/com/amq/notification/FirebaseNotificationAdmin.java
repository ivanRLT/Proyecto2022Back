package com.amq.notification;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

public class FirebaseNotificationAdmin {
	private static FirebaseNotificationAdmin  _instancia =null;
	
	private FirebaseOptions options=null;
	private FirebaseApp firebaseApp=null;
	private FirebaseMessaging firebaseMessaging=null;
	
	public static FirebaseNotificationAdmin getInstancia() {
		if(_instancia==null) {
			_instancia = new FirebaseNotificationAdmin();
		}
		return _instancia;
	}
	
	private FirebaseNotificationAdmin() {}
	
	public void sendNotification(Notification notification,List<String> tokens) throws Exception {
		try {
			if(options==null) {
				options = FirebaseOptions.builder()
				    .setCredentials(
				    	GoogleCredentials.fromStream( new FileInputStream("src/main/resources/static/otas-256c6-firebase-adminsdk-98avn-261a1ed50a.json") )
				    ).build();
				firebaseApp= FirebaseApp.initializeApp(options);
				firebaseMessaging =  FirebaseMessaging.getInstance(firebaseApp);
			}
			
			Map<String, String> map = new HashMap<String, String>();
			
			List<Message> messages = new ArrayList<Message>();
			
			Message message;
			
			for(String token : tokens) {
				message = Message.builder()
		                .setToken(token)
		                .setNotification(notification)
		                .putAllData( map )
		                .build();
				messages.add(message);
			}
			
	        BatchResponse response = firebaseMessaging.sendAll(messages);
	        
	        System.out.println("Notificaciones push: "+response.getSuccessCount() + " messages were sent successfully");
			
		}catch(Exception e) {
			System.out.println("Se ha producido el siguiente error=>\n\t"+e.getMessage());
			throw e;
		}
	}
}
