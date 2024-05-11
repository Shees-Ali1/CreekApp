import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String receiverUserID;

  const ChatScreen({
    super.key,
    required this.receiverUserID,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String currentUserName = "";
  String myDp = "";
  RxString currentUserId = ''.obs;

  Future<void> fetchMyData() async {
    try {

      currentUserId.value = _auth.currentUser!.uid;

      DocumentSnapshot<Map<String, dynamic>> userData =
      await firestore.collection('users').doc(currentUserId.value).get();

      if (!userData.exists) {

        userData = await firestore.collection('provider').doc(currentUserId.value).get();
      }

      setState(() {
        currentUserName = userData.data()?['username'] ?? '';

        myDp = userData.data()?['profilePic'] ?? '';

      });
      debugPrint("WorkingFine");
    } catch (e) {
      Get.snackbar('Error', '$e');
      debugPrint("Error fetchMyData $e");
    }
  }

  // void storeTimestamp() async {
  //
  //
  //
  //   final Timestamp timestamp = Timestamp.now();
  //   try {
  //     if (widget.receiverUserID != '01') {
  //       await _firestore
  //           .collection('chats')
  //           .doc(_firebaseAuth.currentUser!.uid)
  //           .collection('chatters')
  //           .doc(widget.receiverUserID)
  //           .set(
  //         {
  //           "timestamp": timestamp,
  //         },
  //         SetOptions(merge: true),
  //       ).whenComplete(
  //         () async {
  //           debugPrint("Done First Current ID");
  //         },
  //       );
  //
  //       await _firestore
  //           .collection('conversations')
  //           .doc(widget.receiverUserID)
  //           .collection('chatters')
  //           .doc(_firebaseAuth.currentUser!.uid)
  //           .set(
  //         {
  //           "timestamp": timestamp,
  //         },
  //         SetOptions(merge: true),
  //       ).whenComplete(
  //         () async {
  //           debugPrint("Done First receiver ID");
  //         },
  //       );
  //     } else {
  //       debugPrint('widget.screenName is not Inbox');
  //     }
  //   } catch (e) {
  //     debugPrint("Error in Updating Timestamp $e");
  //   }
  // }



  // final ThemeController _themeController =Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchReceiverToken();
    loadBlockState();
    fetchMyData();
    loadUserData();

  }

  Stream<String> getUserStatusStream(String uid) {

    CollectionReference providerCollection = _firestore.collection('provider');

    CollectionReference usersCollection = _firestore.collection('users');


    return StreamZip([
      providerCollection.doc(uid).snapshots(),
      usersCollection.doc(uid).snapshots()
    ]).map((snapshots) {
      final snapshot1 = snapshots[0];
      final snapshot2 = snapshots[1];

      if (snapshot1.exists) {
        final data1 = snapshot1.data() as Map<String, dynamic>?;
        return data1?['onlineStatus'] ?? '';
      } else if (snapshot2.exists) {
        final data2 = snapshot2.data() as Map<String, dynamic>?;
        return data2?['onlineStatus'] ?? '';
      } else {
        return '';
      }
    });
  }

  Future<void> loadBlockState() async {
    //final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String receiverId = widget.receiverUserID;

    try {
      DocumentSnapshot blockListDoc = await firestore
          .collection('BlockList')
          .doc(currentUserId.value)
          .get();

      Map<String, dynamic>? data = blockListDoc.data() as Map<String, dynamic>?;

      List<dynamic>? blockedUsers = data?['Blocked'] as List<dynamic>?;

      setState(() {
        isBlocked = blockedUsers != null && blockedUsers.contains(receiverId);
      });
    } catch (e) {
      debugPrint("Error loading block status: $e");
    }
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void toggleBlock() async {
    //final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String receiverId = widget.receiverUserID;

    try {
      DocumentReference blockListDocRef =
          firestore.collection('BlockList').doc(currentUserId.value);

      DocumentSnapshot blockListDoc = await blockListDocRef.get();

      // Cast the data to Map<String, dynamic>?
      Map<String, dynamic>? data = blockListDoc.data() as Map<String, dynamic>?;

      List<dynamic>? blockedUsers = data?['Blocked'] as List<dynamic>?;

      if (blockedUsers == null) {
        blockedUsers = [];
      }

      if (blockedUsers.contains(receiverId)) {

        blockedUsers.remove(receiverId);
      } else {

        blockedUsers.add(receiverId);
      }

      await blockListDocRef.set({'Blocked': blockedUsers});

      // Update the UI state
      setState(() {
        isBlocked = !isBlocked;
      });
    } catch (e) {
      debugPrint("Error toggling block status: $e");
      // Handle error
    }
  }

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final ScrollController _scrollController = ScrollController();
  // @override
  // void dispose() {
  //   // Dispose of the ScrollController to prevent memory leaks
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  void sendMessage() async {
    String message = _messageController.text;

    if (message.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverUserID,
          _messageController.text, 'widget.senderName', 'widget.senderDp');

      // storeTimestamp();

      //SendPushNotification();
    }
  }



  bool isBlocked = false;


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString username = "".obs;
  RxString fullName = "".obs;
  RxString userDp = "".obs;
  RxString token = ''.obs;
  Future<Map<String, dynamic>> fetchUserData(String uid) async {
    debugPrint('notificationRoute');
    try {
      final userSnapshot = await _firestore.collection('users').doc(uid).get();
      final userSnapshot2 =
      await _firestore.collection('provider').doc(uid).get();

      Map<String, dynamic> userData = {};
      if (userSnapshot.exists) {
        userData = userSnapshot.data()!;
      } else if (userSnapshot2.exists) {
        userData = userSnapshot2.data()!;
      }
      debugPrint('userData: $userData');
      return userData;
    } catch (e) {
      debugPrint('Error fetchUserData $e');

      return {}; // Return an empty map or handle the error case
    }
  }

  loadUserData()async{
    Map receiverData = await fetchUserData(widget.receiverUserID);

    setState(() {
      username.value = receiverData['username'] ?? "empty";
      userDp.value = receiverData['profilePic'] ?? "empty";
      token.value = receiverData['token'] ?? "empty";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: darkBlueTheme,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    debugPrint('Go to user Profile');
                  },
                  child: Row(
                    children: [
                      // SizedBox(
                      //   height: 32,
                      //   width: 32,
                      //   child: CircleAvatar(
                      //     backgroundImage: CachedNetworkImageProvider(userDp.value),
                      //     // AssetImage("assets/images/images1.png"),
                      //     radius: 30,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 6,
                      ),
                      Column(
                        children: [
                          Text(
                            username.value,
                            // style: ubuntu14(true),
                          ),
                          if (widget.receiverUserID != "01")
                            StreamBuilder<String>(
                              stream: getUserStatusStream(widget.receiverUserID),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  // Use the fetched status or provide a default value
                                  String userStatus = snapshot.data!;
                                  return Text(
                                    userStatus,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            userStatus.toLowerCase() == 'online'
                                                ? Colors.green
                                                : Colors.red,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  // Handle errors
                                  debugPrint(
                                      'Error fetching user status: ${snapshot.error}');
                                  return const Text("Error");
                                } else {
                                  // Display a loading state
                                  return const Text("Loading...");
                                }
                              },
                            ),
                        ],
                      ),

                      // IconButton(
                      //   icon: Icon(isBlocked ? Icons.block : Icons.block_outlined),
                      //   onPressed: () {
                      //     toggleBlock();
                      //   },
                      //   tooltip: isBlocked ? 'Unblock' : 'Block',
                      // ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    // color: darkBlueTheme,
                    width: null,
                    child: PopupMenuButton<String>(
                      // color: Color(0xFF262626),
                      color:  Color(0xFF262626),
                      onSelected: (value) {
                        if (value == 'block') {
                          toggleBlock();
                        } else if (value == 'exit') {
                          Navigator.pop(context);
                        } else if (value == 'clear') {
                          Get.toNamed('/ViewJobOffering');
                        } else if (value == 'settings') {
                          //Get.toNamed('/SettingsScreen');
                          // Get.to(()=> const SettingScreen());
                        } else if (value == 'logout') {
                          _signOut();
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'block',
                          child: Text(
                            isBlocked ? 'Unblock'.tr : 'Block',
                            style: TextStyle(
                              color: isBlocked
                                  ? Colors.red
                                  : Colors.green
                            ),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'clear',
                          child: Text(
                            'Clear Chat'.tr,
                            style: TextStyle(
                              color:
                                  Color(0xFF262626),
                            ),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'exit',
                          child: Text(
                            'Close Chat'.tr,
                            style: TextStyle(
                              color:
                                   Color(0xFF262626),
                            ),
                          ),
                        ),
                        // const PopupMenuItem<String>(
                        //   value: 'viewJobs',
                        //   child: Text('View Jobs' , style: popUpMenuTextColor,),
                        // ),

                      ],
                      child: Icon(
                        CupertinoIcons.bars,
                        // color: myWhite,
                        size: 30,
                      )
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: _buildMessageList()),
            _buildMessageInput(),
          ]),
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiverUserID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('loading..'.tr);
          }
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          });

          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((document) => _buildMessageItems(document))
                .toList(),
          );
        });
  }

  Widget _buildMessageItems(DocumentSnapshot document) {
    var width = MediaQuery.of(context).size.width;
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    DateTime timestamp = (data['timestamp'] as Timestamp).toDate();

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: GestureDetector(
          onTap: () async {
            debugPrint("Working");
            String url = data['message'].toString();

            // if (await canLaunch(url)) {
            //   await launch(url);
            // } else {
            //   // error
            //   debugPrint('Could not launch $url');
            // }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: width / 2,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: (data['senderId'] == _firebaseAuth.currentUser!.uid)
                      ? Colors.blueGrey
                      : Colors.grey,
                ),
                // width: width / 2,
                child: Column(
                  crossAxisAlignment:
                      (data['senderId'] == _firebaseAuth.currentUser!.uid)
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  mainAxisAlignment:
                      (data['senderId'] == _firebaseAuth.currentUser!.uid)
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['message'],
                        // style: ubuntu14(true),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _formatTimestamp(timestamp),
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color:
                               Color(0xFF262626))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String amPm = timestamp.hour < 12 ? 'AM' : 'PM';
    int hour = timestamp.hour > 12 ? timestamp.hour - 12 : timestamp.hour;

    return "${twoDigits(hour)}:${twoDigits(timestamp.minute)} $amPm";
  }

  //build message input
  Widget _buildMessageInput() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                  controller: _messageController,

                  //
                  // TextFormField(
                  maxLines: null,
                  minLines: 1,
                  // style: ubuntu14(true),
                  cursorColor:
                       Colors.black,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      fillColor:
                           Colors.grey.withOpacity(0.1),
                      filled: true,
                      hintText: "Write Message..".tr,
                      // hintStyle: ubuntu14(true)
                  )),
            ),

            //SizedBox(width: 8,),
            // Container(
            //   height: 50,
            //   width: 50,
            //   child: IconButton(
            //     onPressed: () async {
            //       FilePickerResult? result = await FilePicker.platform.pickFiles();
            //       if (result != null) {
            //         // Handle the selected files
            //         List<PlatformFile> files = result.files;
            //         final file = result.files.first;
            //         setState(() {
            //           pickedFile = file;
            //           selectedFilename = pickedFile.name;
            //         });
            //
            //         uploadFile();
            //         utils.showSnackbar1(context, 'File is Sending please Wait!!!');
            //
            //       } else {
            //         // User canceled the file picker
            //         debugPrint('User canceled file picking');
            //       }
            //     },
            //     icon: Icon(Icons.attach_file),
            //   ),
            //
            // ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () async {
                  sendMessage();
                  _messageController.clear();

                  //sendPushMessage(token!, 'You have Received a new message from ${widget.senderName}', "Message");
                  debugPrint(
                    "receiver${widget.receiverUserID}",
                  );
                  debugPrint("sender${_firebaseAuth.currentUser!.uid},");
                },
                child: Container(
                    height: 40,
                    width: 40,
                    child: const Image(
                        image: AssetImage("assets/images/Send.png"))),
              ),
            ),

            //Image(image: AssetImage("assets/images/inboxvector.png"))
          ],
        ),
        SizedBox(height: 5,),
      ],
    );
  }



  Future<bool> checkIfBlocked(String receiverId, String currentUserId) async {
    try {
      // Fetching the block list document for the receiver
      DocumentSnapshot blockListDoc =
          await _firestore.collection('BlockList').doc(receiverId).get();

      Map<String, dynamic>? data = blockListDoc.data() as Map<String, dynamic>?;

      // Checking if the current user is in the blocked array
      List<dynamic>? blockedUsers = data?['Blocked'] as List<dynamic>?;

      if (blockedUsers != null && blockedUsers.contains(currentUserId)) {
        return true; // Current user is blocked
      }

      return false; // Current user is not blocked
    } catch (e) {
      debugPrint("Error checking block list: $e");
      return false;
    }
  }

  Future<void> _storeStatus(String status) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
        CollectionReference providerCollection = FirebaseFirestore.instance.collection('provider');

        // Check if the user exists in the "users" collection
        DocumentSnapshot userSnapshot = await userCollection.doc(user.uid).get();

        if (userSnapshot.exists) {
          // Update the "onlineStatus" field in the "users" collection
          await userCollection.doc(user.uid).update({'onlineStatus': status});
        } else {
          // Update the "onlineStatus" field in the "provider" collection
          await providerCollection.doc(user.uid).update({'onlineStatus': status});
        }
      } else {
        debugPrint('User is null.');
      }
    } catch (e) {
      // Handle errors
      debugPrint('$e');
    }
  }

  dynamic pickedFile;
  UploadTask? uploadTask;
  String? selectedFilename;

  // Future<void> uploadFile() async {
  //
  //   try {
  //     if (pickedFile == null) {
  //       // Handle the case where pickedFile is null, show an error message or return early
  //       debugPrint('pickedFile is null');
  //       return;
  //     }
  //
  //     final path = 'files/${await _firebaseAuth.currentUser!.uid}/file/sendFile';
  //
  //     String filePath;
  //
  //     if (pickedFile is XFile) {
  //       filePath = pickedFile!.path!;
  //     } else if (pickedFile is PlatformFile) {
  //       filePath = pickedFile!.path!;
  //     } else {
  //       // Handle the case where the file type is neither XFile nor PlatformFile
  //       utils.showSnackbar(context , 'Invalid file type'.tr);
  //       return;
  //     }
  //
  //     // Ensure that the file path is not null or empty
  //     if (filePath.isEmpty) {
  //       // Handle the case where the file path is empty, show an error message or return early
  //       debugPrint('File path is empty'.tr);
  //       return;
  //     }
  //
  //     final file = File(filePath);
  //
  //     if (!(await file.exists())) {
  //       // Handle the case where the file is null or doesn't exist, show an error message or return early
  //       debugPrint('File does not exist'.tr);
  //       return;
  //     }
  //
  //     final ref = FirebaseStorage.instance.ref().child(path);
  //     setState(() {
  //       uploadTask = ref.putFile(file);
  //     });
  //
  //     await uploadTask?.whenComplete(() async {
  //       final urlDownload = await ref.getDownloadURL();
  //       debugPrint('Download Link: $urlDownload');
  //
  //       if (urlDownload != null) {
  //         final uid =  _firebaseAuth.currentUser!.uid;
  //
  //         List<String> ids = [uid, widget.receiverUserID];
  //         ids.sort();
  //         String chatRoomId = ids.join("_");
  //         String fileUrl = urlDownload;
  //         Message newMessage = Message(
  //           senderId: uid,
  //           senderEmail: 'currentUserEmail',
  //           fileName : urlDownload,
  //           receiverId: widget.receiverUserID,
  //           message: selectedFilename ?? '',
  //           timestamp: Timestamp.now(), senderName: widget.senderName,
  //         );
  //         if (uid != null) {
  //           final userDoc = FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).collection('messages').add(newMessage.toFirestore());
  //
  //
  //           //userDoc.set({'url': urlDownload}, SetOptions(merge: true));
  //           // userDoc.then((DocumentReference document) {
  //           //   // Use the document reference to set additional data
  //           //   document.set({'url': urlDownload}, SetOptions(merge: true));
  //           // }).catchError((error) {
  //           //   // Handle any errors that occurred during the add operation
  //           //   print('Error adding document: $error');
  //           // });
  //         }
  //       }
  //     });
  //
  //     setState(() {
  //       uploadTask = null;
  //     });
  //
  //   } catch (error) {
  //     // Handle errors here, show an error message to the user
  //     utils.showSnackbar1(context , 'Error uploading file: $error');
  //   }
  // }

  // Future<bool> checkIfBlocked(String receiverId, String currentUserId) async {
  //   try {
  //     // Fetch the block list document for the receiver
  //     DocumentSnapshot blockListDoc =
  //     await _firestore.collection('BlockList').doc(receiverId).get();
  //
  //     // Cast the data to Map<String, dynamic>?
  //     Map<String, dynamic>? data = blockListDoc.data() as Map<String, dynamic>?;
  //
  //     // Check if the current user is in the blocked array
  //     List<dynamic>? blockedUsers = data?['Blocked'] as List<dynamic>?;
  //
  //     if (blockedUsers != null && blockedUsers.contains(currentUserId)) {
  //       return true; // Current user is blocked
  //     }
  //
  //     return false; // Current user is not blocked
  //   } catch (e) {
  //     debugPrint("Error checking block list: $e");
  //     return false; // Handle error, for simplicity returning false
  //   }
  // }

  void _signOut() async {
    try {
      await _storeStatus('offline');

      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
