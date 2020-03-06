const admin = require('firebase-admin');
const uuid = require('uuid');

let serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

let db = admin.firestore();

for (var i = 1; i <= 23; i++) {
	let name = 'FIT1031 Lecture ' + (i < 10 ? '0' + i : i);
	let classroom = 'S' + i + ', 13 Collage Walk, Clayton';
	let start = (i < 10 ? '0' + i : i) + ':00'
	let endHour = i + 1
	let end = (endHour < 10 ? '0' + endHour : endHour) + ':00'

	db.collection('lectures').doc(uuid.v4()).set({ 
		'name': name, 
		'teacher': 'Arun Kongaurthu', 
		'classroom': classroom, 
		'start': start, 
		'end': end});	
}

db.collection('carparks').doc('1').set({
	'name': 'Clayton Live Feed 1',
	'availableCount': 256
});

db.collection('carparks').doc('2').set({
	'name': 'Clayton Live Feed 2',
	'availableCount': 252
});

db.collection('carparks').doc('3').set({
	'name': 'Clayton Live Feed 3',
	'availableCount': 211
});


for (var i = 1; i <= 23; i++) {
	let time = (i < 10 ? '0' + i : i) + ':';

	db.collection('shuttleBuses').doc(uuid.v4()).set({'from': 'Clayton', 'to': 'Peninsula', 'time': time + '00'});
	db.collection('shuttleBuses').doc(uuid.v4()).set({'from': 'Clayton', 'to': 'Mornington', 'time': time + '15'});
	db.collection('shuttleBuses').doc(uuid.v4()).set({'from': 'Clayton', 'to': 'Glen Waverley', 'time': time + '30'});
	db.collection('shuttleBuses').doc(uuid.v4()).set({'from': 'Clayton', 'to': 'North Melbourne', 'time': time + '45'});
}
