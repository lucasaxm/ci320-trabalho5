require 'test_helper'

class MovesPokemonsControllerTest < ActionController::TestCase
  setup do
    @moves_pokemon = moves_pokemons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moves_pokemons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moves_pokemon" do
    assert_difference('MovesPokemon.count') do
      post :create, moves_pokemon: { move_id: @moves_pokemon.move_id, pokemon_id: @moves_pokemon.pokemon_id }
    end

    assert_redirected_to moves_pokemon_path(assigns(:moves_pokemon))
  end

  test "should show moves_pokemon" do
    get :show, id: @moves_pokemon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moves_pokemon
    assert_response :success
  end

  test "should update moves_pokemon" do
    patch :update, id: @moves_pokemon, moves_pokemon: { move_id: @moves_pokemon.move_id, pokemon_id: @moves_pokemon.pokemon_id }
    assert_redirected_to moves_pokemon_path(assigns(:moves_pokemon))
  end

  test "should destroy moves_pokemon" do
    assert_difference('MovesPokemon.count', -1) do
      delete :destroy, id: @moves_pokemon
    end

    assert_redirected_to moves_pokemons_path
  end
end
