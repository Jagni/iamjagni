import 'package:flutter/material.dart';
import 'package:iamjagni/screens/profile/widgets/contact/tile.dart';
import 'package:social_media_buttons/social_media_icons.dart';

class ProfileContactList extends StatelessWidget {
  final contactTiles = [
    ContactTile(
        icon: SocialMediaIcons.linkedin_squared,
        name: 'LinkedIn',
        color: Colors.blue[700],
        url: 'https://www.linkedin.com/in/jagni-dasa-b06234b0/'),
    ContactTile(
        icon: SocialMediaIcons.github_circled,
        name: 'Github',
        color: Colors.black,
        url: 'https://www.github.com/jagni/'),
    ContactTile(
        icon: Icons.mail,
        name: 'Email',
        color: Colors.red[700],
        url: Uri(scheme: 'mailto', path: 'mailto:jagnidasa@gmail.com')
            .toString())
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: contactTiles);
  }
}
