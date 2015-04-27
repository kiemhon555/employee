$(document).ready(function() {

	$('#search').autocomplete({
		serviceUrl : 'rest/service/searchAutocomplete',
		paramName : "searchText",
		delimiter : ",",
		transformResult : function(response) {

			return {
				// must convert json to javascript object before process
				suggestions : $.map($.parseJSON(response), function(item) {

					return {
						value : item,
						data : item
					};
				})

			};

		}

	});

});