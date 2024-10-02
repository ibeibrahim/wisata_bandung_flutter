import 'package:flutter/material.dart';
import 'components/favorite_button.dart';
import 'models/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;
  const DetailWebPage({super.key, required this.place});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
      child: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Wisata Bandung',
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Image.asset(widget.place.imageAsset),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 16),
                        Scrollbar(
                          controller: _scrollController,
                          child: Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ListView(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              children: widget.place.imageUrls.map((url) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(url),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                      child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            child: Text(
                              widget.place.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 30.0, fontFamily: 'Staatliches'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.calendar_today),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.place.openDays,
                                    style: informationTextStyle,
                                  )
                                ],
                              ),
                              const FavoriteButton(),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.access_time),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.place.openTime,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.monetization_on),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.place.ticketPrice,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              widget.place.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Oxygen',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
