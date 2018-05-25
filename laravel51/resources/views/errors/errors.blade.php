@if (count($errors) > 0)
    <!-- Form Error List -->
    <div class="alert alert-danger">
        <strong>对不起,您的输入有误!</strong>

        <br><br>

        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ trans($error)}}</li>
            @endforeach
        </ul>
    </div>
@endif
