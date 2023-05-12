import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app/pages/details/details_controller.dart';
import 'package:flutter_application_1/src/data/repositories/data_cocktail_repository.dart';
import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DetailsView extends View {
  final Cocktail cocktail;

  DetailsView(this.cocktail);

  @override
  State<StatefulWidget> createState() {
    return _DetailsViewState(DetailsController(
      DataCocktailRepository(),
      cocktail,
    ));
  }
}

class _DetailsViewState extends ViewState<DetailsView, DetailsController> {
  _DetailsViewState(DetailsController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Container(
              height: 75,
              width: size.width,
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Details Cocktail',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.redAccent,
                    ),
                    child: ControlledWidgetBuilder<DetailsController>(
                      builder: ((context, controller) {
                        return IconButton(
                          onPressed: () {
                            controller.removeCocktail(widget.cocktail.id);
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.white,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: size.width - 90,
              child: Column(
                children: [
                  Container(
                    child: Image.network(widget.cocktail.imageUrl,
                        width: size.width, fit: BoxFit.fill),
                  ),
                  SizedBox(height: 50),
                  Text(
                    widget.cocktail.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: size.width - 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients:',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        for (int count = 0;
                            count < widget.cocktail.ingredients.length;
                            count++)
                          Text(
                            '\t\t\t' +
                                '--' +
                                widget.cocktail.ingredients[count],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
