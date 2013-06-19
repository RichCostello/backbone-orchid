window.Orchid = Backbone.Model.extend({

    urlRoot: "api/orchids",

    initialize: function () {
        this.validators = {};

        this.validators.genus = function (value) {
            return value.length > 0 ? {isValid: true} : {isValid: false, message: "You must enter a Genus"};
        };

        this.validators.species = function (value) {
            return value.length > 0 ? {isValid: true} : {isValid: false, message: "You must enter a Species"};
        };

      
    },

    validateItem: function (key) {
        return (this.validators[key]) ? this.validators[key](this.get(key)) : {isValid: true};
    },

    // TODO: Implement Backbone's standard validate() method instead.
    validateAll: function () {

        var messages = {};

        for (var key in this.validators) {
            if(this.validators.hasOwnProperty(key)) {
                var check = this.validators[key](this.get(key));
                if (check.isValid === false) {
                    messages[key] = check.message;
                }
            }
        }

        return _.size(messages) > 0 ? {isValid: false, messages: messages} : {isValid: true};
    },

    defaults: {
        id: null,
        genus: "",
        species: "",
        awards: "USA",
        color: "Blue",
		sizeofplant: "Large",
		purchaseprice: "$",
		purchasedate: "",
        fragrance: "",
        description: "",
        picture: null
    }
});

window.OrchidCollection = Backbone.Collection.extend({

    model: Orchid,

    url: "api/orchids"

});