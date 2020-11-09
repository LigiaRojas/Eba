import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: FlatButton(
                                  onPressed: () {
                                    Logger().d('Going back from Video Screen - On screen back button');
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset('images/left-arrow.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Color(0xffaad4aa).withOpacity(0.3), BlendMode.overlay),
                    image: AssetImage('images/cows.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 6.0,
              height: 0.0,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background-green.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(14.0),
                  children: [
                    Text('Conoce más sobre\n'
                        'la industria\n'
                        'ganadera.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        color: Color(0xff363839),
                        fontSize: 28.0,
                        height: 1.4,
                      ),
                    ),
                    buildVideoButton(
                      text: 'Generalidades de la raza Holstein',
                      imageAsset: 'images/thumbnail_video_1.jpg',
                      action: () {
                        Logger().d('Going to Video 1 YouTube Player Screen from Videos Screen');
                        Navigator.pushNamed(
                          context,
                          '/youtube-screen',
                          arguments: YoutubeArguments('CTtm3dMaOj8'),
                        );
                      },
                    ),
                    buildVideoButton(
                        text: '¿Cómo comienza la producción?',
                        imageAsset: 'images/thumbnail_video_2.jpg',
                        action: () {
                          Logger().d('Going to Video 2 YouTube Player Screen from Videos Screen');
                          Navigator.pushNamed(
                            context,
                            '/youtube-screen',
                            arguments: YoutubeArguments('e5DXOI9RNQ4'),
                          );
                        },
                    ),
                    buildVideoButton(
                        text: 'Cuidados y alimentación',
                        imageAsset: 'images/thumbnail_video_3.jpg',
                        action: () {
                          Logger().d('Going to Video 3 YouTube Player Screen from Videos Screen');
                          Navigator.pushNamed(
                            context,
                            '/youtube-screen',
                            arguments: YoutubeArguments('wAwrvnKS5yE'),
                          );
                        },
                    ),
                    buildVideoButton(
                        text: 'Enfermedades',
                        imageAsset: 'images/thumbnail_video_4.jpg',
                        action: () {
                          Logger().d('Going to Video 4 YouTube Player Screen from Videos Screen');
                          Navigator.pushNamed(
                            context,
                            '/youtube-screen',
                            arguments: YoutubeArguments('2xE5YNZ6bpU'),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildVideoButton({ String text, String imageAsset, Function action }) {
  return FlatButton(
    padding: EdgeInsets.zero,
    onPressed: action,
    child: Stack(
      fit: StackFit.loose,
      children: [
        Row(
          children: [
            Expanded(
              flex: 15,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(2.8),
                color: Color(0xff363839),
                margin: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Image.asset(imageAsset),
                    Image.asset('images/play_button.png'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 15,
              child: Text(text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Canda Tawa Regular',
                  color: Color(0xff363839),
                  fontSize: 28.0,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class YoutubeArguments {
  final String videoId;

  YoutubeArguments(this.videoId);
}

class YoutubeScreen extends StatefulWidget {
  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  @override
  Widget build(BuildContext context) {
    final YoutubeArguments arguments = ModalRoute.of(context).settings.arguments;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller(arguments.videoId),
      ),
      builder: (context, player) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          player,
        ],
      ),
    );
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

YoutubePlayerController _controller(String videoId) => YoutubePlayerController(
  initialVideoId: videoId,
  flags: YoutubePlayerFlags(
    autoPlay: true,
    mute: false,
  ),
);