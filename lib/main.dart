import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollEffect(),
    );
  }
}

class ScrollEffect extends StatelessWidget {
  const ScrollEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 10,
      thumbVisibility: true,
      radius: const Radius.circular(10),
      child: Scaffold(
          body: CustomScrollView(slivers: [
        SliverAppBar(
          title: const Text('Sliver appBar'),
          backgroundColor: Colors.blueGrey,
          expandedHeight: 200,
          leading: const Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.settings),
            SizedBox(width: 12) //뒷 공간 띄우기
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('images/fruit.jpg', fit: BoxFit.cover),
          ),
        ),
        // const SizedBox(height: 10),  슬리버요소가 아니라서 에러
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8, //수직간격
                  crossAxisSpacing: 8, //수평간격
                ),
                itemCount: 20,
                primary: false,
                shrinkWrap: true,
                // padding: const EdgeInsets.all(8),
                itemBuilder: (context, i) {
                  return MyImageWidget(index: i);
                }),
          ),
        )
      ])),
    );
  }
}

class MyImageWidget extends StatelessWidget {
  final int index;
  const MyImageWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // 최소크기를 가리키는 듯..
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // 모서리 반지름 설정
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0), // Image 위젯의 모서리에도 적용

          child: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
