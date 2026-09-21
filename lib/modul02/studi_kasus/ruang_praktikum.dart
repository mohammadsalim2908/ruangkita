import 'package:flutter/material.dart';
import '../../models/room_session.dart';

class RuangPraktikumPage extends StatefulWidget {
  const RuangPraktikumPage({super.key});

  @override
  State<RuangPraktikumPage> createState() => _RuangPraktikumPageState();
}

class _RuangPraktikumPageState extends State<RuangPraktikumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RuangKita'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'M02-2127',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: roomSessions.length,
        itemBuilder: (context, index) {
          return _RoomCard(
            session: roomSessions[index],
          );
        },
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({
    required this.session,
  });

  final RoomSession session;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.meeting_room_outlined,
                      color: scheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      session.activity,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(session.roomName),
                const SizedBox(height: 4),
                Text(session.category),
                const SizedBox(height: 4),
                Text(session.time),
                const SizedBox(height: 8),
                Text(session.description),
              ],
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(session.status),
          ),
        ),
      ],
    );
  }
}