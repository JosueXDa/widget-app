import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_app/presentation/providers/forex_news_provider.dart';
import 'package:widget_app/presentation/widgets/organisms/news_list.dart';
import 'package:widget_app/presentation/widgets/molecules/header.dart';
import 'package:widget_app/presentation/widgets/atoms/spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Cargar noticias al inicializar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ForexNewsProvider>().fetchNews();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forex News'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<ForexNewsProvider>().fetchNews(),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Consumer<ForexNewsProvider>(
        builder: (context, provider, _) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: MoleculeHeader(
                    title: 'Financial Events',
                    subtitle:
                        'Latest forex economic calendar events and releases',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _DateFilterButton(
                    onDateSelected: (date) {
                      provider.fetchNews(date: date);
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: AtomSpacer(height: 16),
              ),
              SliverFillRemaining(
                child: OrganismNewsList(
                  news: provider.news,
                  isLoading: provider.isLoading,
                  error: provider.error,
                  onRetry: () => provider.fetchNews(),
                  scrollController: _scrollController,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DateFilterButton extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const _DateFilterButton({
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2007),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                onDateSelected(selectedDate);
              }
            },
            icon: const Icon(Icons.calendar_today),
            label: const Text('Select Date'),
          ),
        ),
      ],
    );
  }
}
