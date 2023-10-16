<!DOCTYPE html>
<html>
<head>
    <title>Ajax Search Example</title>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $('#search').keyup(function() {
                var keyword = $(this).val();
                if (keyword.trim() !== '') {
                    $.ajax({
                        url: 'SearchServlet',
                        type: 'POST',
                        data: {keyword: keyword},
                        success: function(data) {
                            var result = '';
                            if (data != null){
                                $.each(data, function(index, item) {
                                    result += '<div>' + item.name  + '</div>';
                                    console.log(result)
                                });
                            }
                            $('#result').html(result);
                        }
                    });
                } else {
                    $('#result').html('');
                }
            });
        });
    </script>
</head>
<body>
<input type="text" id="search">
<div id="result"></div>
</body>
</html>
