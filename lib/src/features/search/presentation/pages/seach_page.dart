import 'package:applab/src/core/domain/entities/laboratory.dart';
import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/core/theme/app_colors.dart';
import 'package:applab/src/core/theme/app_text_styles.dart';
import 'package:applab/src/features/search/presentation/search_notifier.dart';
import 'package:applab/src/shared/lab_card.dart';
import 'package:applab/src/shared/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});
   
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final state = ref.watch(searchNotifierProvider); 

    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Buscar Exámenes'),
        centerTitle: true,
        leading: IconButton(
        icon: const Icon(Icons.filter_list_rounded, color: AppColors.primary), // 👈 botón de menú
          onPressed: () {
            // Acción para abrir drawer o menú lateral
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Menú presionado")),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: AppColors.primary,), // 👈 botón de usuario
            onPressed: () {
              context.push(AppRouter.account);
            },
          ),
        ],),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(
              hint: 'Buscar por tipo de examen',
            ),
            SizedBox(height: 16,),
            Expanded(
              child: state.when(
                data: (labs) => labs.isEmpty ? 
                  const Center(child: Text('No se encontraron resultados'),) : 
                  ListView.separated( 
                    itemCount: labs.length,
                    itemBuilder: (ctx, i) {
                      final Laboratory lab = labs[i];
                      return LabCard(
                        title: lab.Name,
                        district: lab.District,
                        kilometer: lab.Kilometer,
                        address: lab.Address,
                        price: lab.Price, 
                        onTap: () {  },
                      );
                    },
                    separatorBuilder: (ctx, i) => SizedBox(height: 10,)
                  ), 
                  
                error: (err, _) => Center(child: Text("Error: $err"),), 
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary,),
                )))
          ],
        ),)
    );
  }
}