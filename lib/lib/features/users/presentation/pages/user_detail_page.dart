// lib/features/users/presentation/pages/user_detail_page.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../domain/entities/user_detail.dart';
import '../controller/user_detail_notifier.dart';

@RoutePage() // ➔ AutoRoute അനോട്ടേഷൻ
class UserDetailPage extends ConsumerStatefulWidget {
  final int userId; // ➔ കൺസ്ട്രക്ടർ വഴി ലിസ്റ്റിൽ നിന്നും ഐഡി വാങ്ങുന്നു

  const UserDetailPage({
    required this.userId,
    super.key,
  });

  @override
  ConsumerState<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends ConsumerState<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    // ➔ നമ്മൾ നൽകിയ userId നോട്ടിഫയറിലേക്ക് പാസ്സ് ചെയ്ത് വാച്ച് ചെയ്യുന്നു
    final state = ref.watch(userDetailNotifierProvider(widget.userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: CommonLoader<UserDetailEntity>(
        state: state,
        onData: (detail) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(userDetailNotifierProvider(widget.userId).notifier).getUserDetails(widget.userId);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // യൂസർ ചിത്രം
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(detail.imageUrl),
                    ),
                    const SizedBox(height: 16),
                    // യൂസർ പേര്
                    Text(
                      detail.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // യൂസർ ഇമെയിൽ
                    Text(
                      detail.email,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const Divider(height: 32),
                    // മറ്റ് വിവരങ്ങൾ കാർഡിൽ കാണിക്കുന്നു
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildInfoRow(Icons.cake, 'Age', '${detail.age} years old'),
                            _buildInfoRow(Icons.person, 'Gender', detail.gender),
                            _buildInfoRow(Icons.phone, 'Phone', detail.phone),
                            _buildInfoRow(Icons.school, 'University', detail.university),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ചെറിയൊരു ഹെൽപ്പർ വിഡ്ജറ്റ് (റോകൾ ഉണ്ടാക്കാൻ)
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 16),
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
