part of 'digimon_view_general.dart';
class _ListDigimon extends StatelessWidget {
  const _ListDigimon({required this.listOfDigimon});
  final List<DigimonModel> listOfDigimon;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: listOfDigimon.length,
      itemBuilder:(context, index) {
       final loopIndexDigimon = listOfDigimon[index];
       return ListTile(
        minVerticalPadding: 4.0,
        tileColor: _colorsByLevel(loopIndexDigimon.level),
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child:SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              loopIndexDigimon.img,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                 return Container(
              color: Colours.crimson,
              alignment: Alignment.center,
              child: const Text(
                '404',
                style: TextStyle(fontSize: 15),
              ),);
              },
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress == null) return child;
                return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),);
              },
            )
        ),),
        title: Text(loopIndexDigimon.name),
        subtitle: Text(loopIndexDigimon.level),
        onTap: () {
          if(loopIndexDigimon.img == ""){
            Future(()=>digimonSimpleErrorAlert(context,"Digimon no encontrado"));
          }
          _specifiDigimon(context,loopIndexDigimon);
        } 
       );
      },);
  }
}