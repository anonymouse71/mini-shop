/*
angular.module('shopApp', [
  'shopApp.controllers',
  'shopApp.factories'
]);*/

function isEmpty(obj) {
    for(var prop in obj) {
        if(obj.hasOwnProperty(prop))
            return false;
    }

    return true;
}

var app = angular.module('shopApp', []);

app.controller('shopController', ['$scope', 'shopService', function($scope, shopService) {

    $scope.cartItems = [];
    /*$scope.cartItems = [
        {
            id: 1,
            image: "/uploads/product_photo/image/1/list_1.jpg",
            name: 'car',
            price: 5.5,
            quantity: 1
        },
        {
            id: 2,
            image: "/uploads/product_photo/image/4/list_4.jpg",
            name: 'mouse',
            price: 5,
            quantity: 2
        }
    ];*/

    $scope.products = [];

    loadCartItems();

    $scope.product = function(id) {
        var item = stockItems[id];
        return item;
    };

    $scope.addToCart = function(pId, i) {

        shopService.addToServerCart(pId)
            .then(
            loadCartItems,
            function( errorMessage ) {

                console.warn( errorMessage );

            }
        );
    };

    $scope.removeItem = function(pId) {
        console.log(pId);

        shopService.removeFromServerCart(pId)
            .then(
            loadCartItems,
            function( errorMessage ) {

                console.warn( errorMessage );

            }
        );
    };

    $scope.grandTotal = function() {
        var index, product, sum = 0;
        var products = $scope.cartItems;
        for(index in products) {

            product = products[index];
            sum = sum + ( product.price * product.quantity );
        }
        return sum;
    }

    $scope.cartIsEmpty = function() {
        if(isEmpty($scope.cartItems)) { return true; }
        return false;
    }

    function updateCartItems( cartItems ) {

        $scope.cartItems = cartItems;
    }

    // I load the remote data from the server.
    function loadCartItems() {
        shopService.getCartItems()
            .then(
            function( cartItems ) {

                updateCartItems( cartItems );

            }
        );
    }

}]);


app.factory('shopService', function ($http, $q) {
    return ({
        addToServerCart: addToServerCart,
        removeFromServerCart: removeFromServerCart,
        getCartItems: getCartItems
    });


    function addToServerCart(pId) {

        var request = $http({
            method: "post",
            url: "/line_items.json",
            data: {
                product_id: pId
            }
        });

        return( request.then( handleSuccess, handleError ) );
    }

    function removeFromServerCart(pId) {
        var request = $http({
            method: 'delete',
            url: '/line_items/' + pId + '.json'
        });

        return( request.then( handleSuccess, handleError ) );
    }

    function getCartItems() {

        var request = $http({
            method: 'get',
            url: '/cart_items.json'
        });

        return( request.then( handleSuccess, handleError ) );
    }

    function handleError(response) {

        if (
            !angular.isObject(response.data) || !response.data.message
        ) {

            return ( $q.reject("An unknown error occurred.") );

        }

        // Otherwise, use expected error message.
        return ( $q.reject(response.data.message) );

    }

    function handleSuccess(response) {

        return ( response.data );

    }
});



