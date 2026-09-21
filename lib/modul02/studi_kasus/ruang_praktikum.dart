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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          int columns;
          if (width < 600) {
            columns = 1;
          } else if (width < 840) {
            columns = 2;
          } else {
            columns = 3;
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status penggunaan ruang hari ini',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Ruang Rapat & Coworking',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: columns == 1
                      ? ListView.separated(
                          itemCount: roomSessions.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return _RoomCard(
                              session: roomSessions[index],
                            );
                          },
                        )
                      : GridView.builder(
                          itemCount: roomSessions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: columns == 2 ? 1.15 : 1.25,
                          ),
                          itemBuilder: (context, index) {
                            return _RoomCard(
                              session: roomSessions[index],
                            );
                          },
                        ),
                ),
              ],
            ),
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