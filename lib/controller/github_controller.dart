import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchPinnedProjects() async {
  final githubToken = dotenv.env['GITHUB_TOKEN'];
  final username = dotenv.env['GITHUB_USERNAME'];
  final useGithubData = dotenv.env['USE_GITHUB_DATA']?.toLowerCase() == 'true';

  if (!useGithubData) return [];
  if (githubToken == null || username == null) return [];

  final url = Uri.parse('https://api.github.com/graphql');
  const query = '''
    query(\$login: String!) {
      user(login: \$login) {
        pinnedItems(first: 6, types: [REPOSITORY]) {
          edges {
            node {
              ... on Repository {
                id
                name
                description
                url
                homepageUrl
                stargazers { totalCount }
                forkCount
                primaryLanguage { name color }
              }
            }
          }
        }
      }
    }
  ''';

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $githubToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'query': query,
        'variables': {'login': username},
      }),
    );

    final data = jsonDecode(response.body);
    // ✅ Debug

    if (response.statusCode == 200) {
      final edges = data['data']?['user']?['pinnedItems']?['edges'] ?? [];
      return List<Map<String, dynamic>>.from(edges.map((e) => e['node']));
    }
    return [];
  } catch (e) {
    return [];
  }
}
