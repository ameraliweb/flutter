import 'package:flutter/material.dart';

void main() {
  runApp(const ModelsApp());
}

class ModelsApp extends StatelessWidget {
  const ModelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نماذج Flutter 5 و 6',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3D5AFE),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
      ),
      home: const ModelsHome(),
    );
  }
}

class ModelsHome extends StatefulWidget {
  const ModelsHome({super.key});

  @override
  State<ModelsHome> createState() => _ModelsHomeState();
}

class _ModelsHomeState extends State<ModelsHome> {
  int _selectedModel = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _selectedModel == 0 ? 'النموذج الخامس' : 'النموذج السادس',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _selectedModel == 0
                ? const ModelFiveScreen(key: ValueKey('model-five'))
                : const ModelSixScreen(key: ValueKey('model-six')),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedModel,
          onDestinationSelected: (index) {
            setState(() => _selectedModel = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.looks_one_outlined),
              selectedIcon: Icon(Icons.looks_one),
              label: 'النموذج الخامس',
            ),
            NavigationDestination(
              icon: Icon(Icons.looks_two_outlined),
              selectedIcon: Icon(Icons.looks_two),
              label: 'النموذج السادس',
            ),
          ],
        ),
      ),
    );
  }
}

class ModelFiveScreen extends StatelessWidget {
  const ModelFiveScreen({super.key});

  Future<void> _showConfirmationDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('تأكيد الأمر'),
          content: const Text('هل تريد تنفيذ هذا الإجراء؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم التأكيد بنجاح')),
                );
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SectionTitle(
            number: '1',
            title: 'الواجهة الأولى: زر يظهر نافذة منبثقة',
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  const Icon(Icons.delete_outline, size: 56, color: Colors.red),
                  const SizedBox(height: 12),
                  const Text(
                    'حذف عنصر',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  FilledButton(
                    onPressed: () => _showConfirmationDialog(context),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 34,
                        vertical: 13,
                      ),
                    ),
                    child: const Text('حذف'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle(
            number: '2',
            title: 'الواجهة الثانية: شريط أفقي من الأيقونات',
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _IconAction(icon: Icons.home, color: Colors.blue, label: 'الرئيسية'),
                  _IconAction(icon: Icons.search, color: Colors.green, label: 'بحث'),
                  _IconAction(icon: Icons.favorite, color: Colors.red, label: 'المفضلة'),
                  _IconAction(icon: Icons.settings, color: Colors.orange, label: 'الإعدادات'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModelSixScreen extends StatefulWidget {
  const ModelSixScreen({super.key});

  @override
  State<ModelSixScreen> createState() => _ModelSixScreenState();
}

class _ModelSixScreenState extends State<ModelSixScreen> {
  int _counter = 15;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SectionTitle(
            number: '1',
            title: 'الواجهة الأولى: ثلاث حاويات مقسمة على امتداد الواجهة',
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 270,
            child: Row(
              children: const [
                Expanded(child: _ColorContainer(color: Color(0xFFFF4038), label: '1')),
                SizedBox(width: 10),
                Expanded(child: _ColorContainer(color: Colors.white, label: '2', darkText: true)),
                SizedBox(width: 10),
                Expanded(child: _ColorContainer(color: Colors.black, label: '3')),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle(
            number: '2',
            title: 'الواجهة الثانية: أزرار تنقص وتزيد من قيمة العداد',
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              child: Column(
                children: [
                  const Text('العداد', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _CounterButton(
                        icon: Icons.remove,
                        color: Colors.red,
                        onPressed: () => setState(() => _counter--),
                      ),
                      SizedBox(
                        width: 90,
                        child: Center(
                          child: Text(
                            '$_counter',
                            style: const TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      _CounterButton(
                        icon: Icons.add,
                        color: Colors.green,
                        onPressed: () => setState(() => _counter++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String number;
  final String title;

  const _SectionTitle({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            number,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _IconAction extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _IconAction({required this.icon, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(color: color, fontSize: 11)),
      ],
    );
  }
}

class _ColorContainer extends StatelessWidget {
  final Color color;
  final String label;
  final bool darkText;

  const _ColorContainer({required this.color, required this.label, this.darkText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: darkText ? Border.all(color: Colors.grey.shade300) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: darkText ? Colors.black : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _CounterButton({required this.icon, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: Icon(icon),
      color: Colors.white,
      style: IconButton.styleFrom(backgroundColor: color),
      tooltip: icon == Icons.add ? 'زيادة' : 'نقصان',
    );
  }
}
