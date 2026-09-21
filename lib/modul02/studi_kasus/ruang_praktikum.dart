import 'package:flutter/material.dart';
import '../../models/room_session.dart';

class RuangPraktikumPage extends StatefulWidget {
  const RuangPraktikumPage({super.key});

  @override
  State<RuangPraktikumPage> createState() => _RuangPraktikumPageState();
}

class _RuangPraktikumPageState extends State<RuangPraktikumPage> {
  String selectedCategory = 'Semua';
  String selectedStatus = 'Semua';

  List<RoomSession> get filteredSessions {
    return roomSessions.where((session) {
      final categoryMatch = selectedCategory == 'Semua' ||
          session.category == selectedCategory;

      final statusMatch =
          selectedStatus == 'Semua' || session.status == selectedStatus;

      return categoryMatch && statusMatch;
    }).toList();
  }

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
                Text(
                  'Kategori',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    'Semua',
                    'Ruang Rapat',
                    'Coworking',
                  ].map((category) {
                    return ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                Text(
                  'Status',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    'Semua',
                    'Berlangsung',
                    'Akan Datang',
                    'Selesai',
                    'Tersedia',
                  ].map((status) {
                    return ChoiceChip(
                      label: Text(status),
                      selected: selectedStatus == status,
                      onSelected: (selected) {
                        setState(() {
                          selectedStatus = status;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: filteredSessions.isEmpty
                      ? const Center(
                          child: Text(
                            'Tidak ada ruang yang sesuai filter.',
                          ),
                        )
                      : columns == 1
                          ? ListView.separated(
                              itemCount: filteredSessions.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final session = filteredSessions[index];

                                return _RoomCard(
                                  session: session,
                                  onTap: () => _showDetail(session),
                                );
                              },
                            )
                          : GridView.builder(
                              itemCount: filteredSessions.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio:
                                    columns == 2 ? 1.15 : 1.25,
                              ),
                              itemBuilder: (context, index) {
                                final session = filteredSessions[index];

                                return _RoomCard(
                                  session: session,
                                  onTap: () => _showDetail(session),
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

  void _showDetail(RoomSession session) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        bool isFavorite = false;

        return StatefulBuilder(
          builder: (context, setSheetState) {
            final scheme = Theme.of(context).colorScheme;

            return SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    session.roomName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    session.activity,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text('Waktu: ${session.time}'),
                  const SizedBox(height: 8),
                  Text('Status: ${session.status}'),
                  const SizedBox(height: 8),
                  Text('Kategori: ${session.category}'),
                  const SizedBox(height: 16),
                  Text(
                    'Deskripsi',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(session.description),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: isFavorite,
                    onChanged: (value) {
                      setSheetState(() {
                        isFavorite = value;
                      });
                    },
                    title: const Text('Tandai sebagai favorit'),
                    secondary: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: scheme.primary,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({
    required this.session,
    required this.onTap,
  });

  final RoomSession session;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
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