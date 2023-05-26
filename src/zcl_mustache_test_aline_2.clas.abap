CLASS zcl_mustache_test_aline_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
          CONSTANTS: BEGIN OF c_type,
                 I    TYPE string VALUE 'Primeira Triologia',
                 II   TYPE string VALUE 'Segunda Triologia',
                 III  TYPE string VALUE 'Terceira Triologia',
                 spin type string VALUE 'Spinoff',
               END OF c_type.

  TYPES:
      BEGIN OF ty_movies,
        movie  TYPE string,
        date   type string,
        type   type string,
      END OF ty_movies,

      ty_movies_tt TYPE STANDARD TABLE OF ty_movies WITH DEFAULT KEY,

      BEGIN OF ty_list_movie,
        list_name TYPE string,
        movies     TYPE ty_movies_tt,
      END OF ty_list_movie.
ENDCLASS.



CLASS ZCL_MUSTACHE_TEST_ALINE_2 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.


  DATA lv_text TYPE string.
  DATA(c_nl) = cl_abap_char_utilities=>newline.
  DATA lt_my_data TYPE STANDARD TABLE OF ty_list_movie WITH DEFAULT KEY.
  DATA lr_data TYPE REF TO ty_list_movie.
  DATA lo_mustache TYPE REF TO zcl_mustache.

  APPEND INITIAL LINE TO lt_my_data REFERENCE INTO lr_data.
  lr_data->list_name = 'Filmes Star Wars ordem cronologica'.
  lr_Data->movies = VALUE ty_movies_tt(
      ( movie = 'Episódio 1 - A Ameaça Fantasma'       date = '19/05/199' type = c_type-i )
      ( movie = 'Episódio 2 - Ataque dos Clones'       date = '19/05/199' type = c_type-i )
      ( movie = 'Episódio 3 - A Vingança dos Sith'     date = '19/05/199' type = c_type-i )
      ( movie = 'Solo: Uma História Star Wars'         date = '19/05/199' type = c_type-spin )
      ( movie = 'Rogue One: Uma História Star Wars'    date = '19/05/199' type = c_type-spin )
      ( movie = 'Episódio 4 - Uma Nova Esperança'      date = '19/05/199' type = c_type-ii )
      ( movie = 'Episódio 5 - O Império Contra-Ataca'  date = '19/05/199' type = c_type-ii )
      ( movie = 'Episódio 6 - O Retorno de Jedi'       date = '19/05/199' type = c_type-ii )
      ( movie = 'Episódio 7 - O Despertar da Força'    date = '19/05/199' type = c_type-iii )
      ( movie = 'Episódio 8 - Os Últimos Jedi'         date = '19/05/199' type = c_type-iii )
      ( movie = 'Episódio 9 - A Ascensão Skywalker'    date = '19/05/199' type = c_type-iii )

   ).

  TRY.
      lo_mustache = zcl_mustache=>create(
          '<!DOCTYPE html>'                                                        && c_nl &&
          '<html>'                                                                 && c_nl &&
          '  <head>'                                                               && c_nl &&
          '    <title>Bem vindo a <b>{{list_name}}</b>!</title>'                   && c_nl &&
          '  </head>'                                                              && c_nl &&
          '<body>'                                                               && c_nl &&
           '<table>'                                                               && c_nl &&
           ' <tr><td>FILME</td><td>DATA</td><td>TIPO</td>'                         && c_nl &&
           ' {{#movies}}'                                                          && c_nl &&
           ' <tr><td>{{movie}}</td><td>{{date}}</td><td>{{type}}</td>'             && c_nl &&
           ' {{/movies}}'                                                          && c_nl &&
           '</table>'                                                              && c_nl &&
           '</body>'                                                               && c_nl &&
           '</html>' ).

        lv_text = lo_mustache->render( lt_my_data ).
        out->write( lv_text ).
      CATCH zcx_mustache_error INTO DATA(error).
        out->write( error->get_text( ) ).
    ENDTRY.

ENDMETHOD.
ENDCLASS.
