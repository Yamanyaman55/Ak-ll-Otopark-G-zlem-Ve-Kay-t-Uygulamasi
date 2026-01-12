import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:park_note/core/app_theme.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildSectionHeader('Genel'),
          _buildListTile(
            title: 'Dil',
            subtitle: _selectedLanguage,
            icon: LucideIcons.globe,
            onTap: () {

            },
          ),
          SwitchListTile(
            title: const Text('Bildirimler'),
            subtitle: const Text('Uygulama içi bildirimleri al'),
            value: _notificationsEnabled,
            onChanged: (val) {
              setState(() {
                _notificationsEnabled = val;
              });
            },
            secondary: const Icon(LucideIcons.bell, color: AppTheme.primaryBlue),
            activeColor: AppTheme.primaryBlue,
          ),
          const Divider(),
          _buildSectionHeader('Görünüm'),
          _buildListTile(
            title: 'Tema',
            subtitle: 'Sistem Teması',
            icon: LucideIcons.moon,
            onTap: () {

            },
          ),
          const Divider(),
          _buildSectionHeader('Hakkında'),
          _buildListTile(
            title: 'Versiyon',
            subtitle: '1.0.0',
            icon: LucideIcons.info,
            trailing: const SizedBox.shrink(),
          ),
          _buildListTile(
            title: 'Gizlilik Politikası',
            icon: LucideIcons.fileText,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.primaryBlue,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    String? subtitle,
    required IconData icon,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(LucideIcons.chevronRight, size: 20, color: Colors.grey),
      onTap: onTap,
    );
  }
}
