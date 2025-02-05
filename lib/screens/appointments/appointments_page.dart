import 'package:flutter/material.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final List<Appointment> _appointments = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  void _loadInitialData() {
    // Replace with actual data fetching
    _appointments.addAll(List.generate(10, (index) => Appointment.mock()));
    setState(() {});
  }

  void _loadMoreData() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    _appointments.addAll(List.generate(5, (index) => Appointment.mock()));
    setState(() {
      _page++;
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Your Trip'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadInitialData(),
        child: ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: _appointments.length + 1,
          itemBuilder: (context, index) {
            if (index < _appointments.length) {
              return AppointmentCard(appointment: _appointments[index]);
            }
            return _isLoading
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF4BBDD8),
      unselectedItemColor: const Color(0xFF98A1B2),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'Go',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFCFD4DC), width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildTimeRow(),
            const SizedBox(height: 16),
            _buildParticipants(),
            const SizedBox(height: 16),
            _buildStatusIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appointment.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1D2838),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Text(
            appointment.date,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRow() {
    return Row(
      children: [
        const Icon(Icons.access_time, size: 16, color: Color(0xFF667084)),
        const SizedBox(width: 8),
        Text(
          appointment.time,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF667084),
          ),
        ),
      ],
    );
  }

  Widget _buildParticipants() {
    return SizedBox(
      height: 56,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...appointment.participants.map((p) => _buildParticipantAvatar(p)),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildParticipantAvatar(Participant participant) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(participant.avatarUrl),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: participant.statusColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                participant.statusIcon,
                size: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3F6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFCFD4DC), width: 0.5),
        ),
        child: const Icon(Icons.add, color: Color(0xFF667084)),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: appointment.statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            appointment.status.toUpperCase(),
            style: TextStyle(
              color: appointment.statusColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}

// Data Models
class Appointment {
  final String title;
  final String date;
  final String time;
  final String status;
  final Color statusColor;
  final List<Participant> participants;

  Appointment({
    required this.title,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.participants,
  });

  factory Appointment.mock() {
    return Appointment(
      title: 'To Work',
      date: 'Today',
      time: '08:00 AM',
      status: 'Confirmed',
      statusColor: const Color(0xFF12B669),
      participants: List.generate(3, (index) => Participant.mock()),
    );
  }
}

class Participant {
  final String avatarUrl;
  final IconData statusIcon;
  final Color statusColor;

  Participant({
    required this.avatarUrl,
    required this.statusIcon,
    required this.statusColor,
  });

  factory Participant.mock() {
    return Participant(
      avatarUrl: 'https://via.placeholder.com/48',
      statusIcon: Icons.check,
      statusColor: const Color(0xFF12B669),
    );
  }
}
