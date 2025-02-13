/*
import 'package:flutter/material.dart';
import '../../models/contact.dart';
import 'chat_page.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  // Dummy data for demonstration
  final List<Contact> contacts = [
    Contact(
      id: '1',
      name: 'Adam',
      lastMessage: 'Hey, are you available for a ride?',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
      isOnline: true,
    ),
    Contact(
      id: '2',
      name: 'Adam Mehdi',
      lastMessage: 'Thanks for the ride!',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    Contact(
      id: '3',
      name: 'Nathan FUmal',
      lastMessage: 'See you tomorrow at 9 AM',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
      isOnline: true,
    ),
  ];

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == now.year) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
    return '${time.day}/${time.month}/${time.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Implement more options
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                  child: contact.photoUrl != null
                      ? null
                      : Text(
                          contact.name[0],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                if (contact.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            title: Text(
              contact.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              contact.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              _formatTime(contact.lastMessageTime),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(contact: contact),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement new chat functionality
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
} 

*/

import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  int _currentIndex = 2; // Adjust this index based on your navigation needs
  final List<Contact> contacts = [
    Contact(
      name: 'Early Birds Group',
      status: 'Online',
      image: 'https://via.placeholder.com/48x48',
      isOnline: true,
    ),
    Contact(
      name: 'Oliver Wilson',
      status: 'Last seen 2h ago',
      image: 'https://via.placeholder.com/48x48',
    ),
    // Add more contacts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contacts', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          CircleAvatar(backgroundColor: Color(0xFF4BBDD8)),
          SizedBox(width: 8),
          IconButton(icon: Icon(Icons.search), onPressed: _showSearch),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) => ContactItem(
                contact: contacts[index],
                onTap: () => _openChat(context, contacts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearch() {
    // Implement search functionality
  }

  

  BottomNavigationBarItem _buildNavItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  void _openChat(BuildContext context, Contact contact) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatDetailPage(contact: contact)),
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactItem({required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(contact.image),
        child: contact.isOnline ? _buildOnlineIndicator() : null,
      ),
      title: Text(contact.name, style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      )),
      subtitle: Text(contact.status, style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      )),
      trailing: Icon(Icons.chat_bubble_outline, color: Color(0xFF4BBDD8)),
    );
  }

  Widget _buildOnlineIndicator() => Align(
    alignment: Alignment.bottomRight,
    child: Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    ),
  );
}

class Contact {
  final String name;
  final String status;
  final String image;
  final bool isOnline;

  Contact({
    required this.name,
    required this.status,
    required this.image,
    this.isOnline = false,
  });
}

class ChatDetailPage extends StatelessWidget {
  final Contact contact;

  const ChatDetailPage({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          CircleAvatar(backgroundImage: NetworkImage(contact.image)),
          SizedBox(width: 12),
          Text(contact.name),
        ]),
      ),
      body: Column(
        children: [
          Expanded(child: ListView()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF4BBDD8)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}