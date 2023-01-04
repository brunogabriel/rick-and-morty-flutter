import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/character/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/character/presentation/widgets/character_card_widget.dart';
import 'package:rick_and_morty/shared/widgets/default_loading_widget.dart';
import 'package:rick_and_morty/shared/widgets/default_try_again_widget.dart';

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({Key? key}) : super(key: key);

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state.result == ResultState.initial ||
                state.result == ResultState.loading && state.isFirstPage) ...{
              const Center(
                child: DefaultLoadingWidget(),
              )
            } else if (state.result == ResultState.error &&
                state.isFirstPage) ...{
              Center(
                child: DefaultTryAgainWidget(
                  onPressed: _requestCharacters,
                ),
              )
            } else ...{
              ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < state.characters.length) {
                    return CharacterCardWidget(
                      response: state.characters[index],
                      onTap: () {},
                    );
                  } else if (state.result == ResultState.error) {
                    return DefaultTryAgainWidget(
                      onPressed: _requestCharacters,
                    );
                  } else {
                    return const DefaultLoadingWidget();
                  }
                },
                itemCount: state.hasReachedMax
                    ? state.characters.length
                    : state.characters.length + 1,
              )
            }
          ],
        );
      },
    );
  }

  void _requestCharacters() {
    context.read<CharacterBloc>().add(CharacterRequestEvent());
  }

  void _onScrollListener() {
    if (_isBottomReached &&
        context.read<CharacterBloc>().state.result != ResultState.error) {
      _requestCharacters();
    }
  }

  bool get _isBottomReached {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
