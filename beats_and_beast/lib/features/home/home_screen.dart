import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music App"),
        actions: [
          IconButton(
            onPressed: () {
              //Naigate to settings
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Genre Selection
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Genres',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _GenreCard(genre: 'Rock'),
                  _GenreCard(genre: 'Pop'),
                  _GenreCard(genre: 'Hip-Hop'),
                  _GenreCard(genre: 'Bollywood'),
                  _GenreCard(genre: 'Romantic'),
                ],
              ),
            ),

            // Recently played section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recently Played',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  // Navigate to Player Screen
                },
                leading: const Icon(Icons.music_note),
                title: Text('Song ${index + 1}'),
                subtitle: const Text('Artist Name'),
              ),
            ),

            // Shuffle Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      // Shuffle and play random music
                    },
                    child: const Text('Shuffle Play')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenreCard extends StatelessWidget {
  final String genre;
  const _GenreCard({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to genre based search
        },
        child: Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            genre,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
