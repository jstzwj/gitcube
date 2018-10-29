@extends('profile.tpl')


@section('overview')
<div class="ui top attached tabular menu">
    <a class="active item" href="#">Overview</a>
    <a class="item" href="#">Repositories</a>
    <a class="item" href="#">Stars</a>
    <a class="item" href="#">Followers</a>
    <a class="item" href="#">Following</a>
</div>
<div class="ui bottom attached active tab segment" style="min-width: 830px;">
    <div class="ui two column grid">
        <div class="row">
            <div class="column">
                <div class="ui fluid card">
                    <div class="content">
                        <a class="header" href="#">Mocores</a>
                        <div class="description">
                            <p>A distributed, high-scale computing system</p>
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="left floated">
                            <a href="#" class="item">
                                <img src="assets/octicons-8.1.0/package/build/svg/star.svg" height="17"/>
                                Star
                            </a>
                            <a href="#" class="item">
                                <img src="assets/octicons-8.1.0/package/build/svg/git-branch.svg" height="17"/>
                                Fork
                            </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="ui fluid card">
                    <div class="content">
                        <a class="header" href="#">Minecase</a>
                        <div class="description">
                            <p>A distributed minecraft server in dotnet core</p>
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="left floated">
                            <a href="#" class="item">
                                <img src="assets/octicons-8.1.0/package/build/svg/star.svg" height="17"/>
                                Star
                            </a>
                            <a href="#" class="item">
                                <img src="assets/octicons-8.1.0/package/build/svg/git-branch.svg" height="17"/>
                                Fork
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="column"></div>
            <div class="column"></div>
        </div>
        <div class="row">
            <div class="column"></div>
            <div class="column"></div>
        </div>
    </div>
    <div class="ui two column divided grid">
        <div id="cal-heatmap" class="twelve wide column" style="min-width: 660px;"></div>
        <div class="two wide column">
            <div class="ui buttons vertical">
                <button class="ui button" id="previousSelector-a-previous">previous</button>
                <button class="ui button" id="previousSelector-a-next">next</button>
            </div>
        </div>
    </div>
</div>

@endsection

@section('cal-heatmap')
<script type="text/javascript">
	var cal = new CalHeatMap();
    cal.init({ itemSelector: "#cal-heatmap",
        previousSelector: "#previousSelector-a-previous",
        nextSelector: "#previousSelector-a-next",
        domain: "year",
        subDomain: "day",
        data: "datas-years.json",
        cellSize: 10,
        range: 1,
        legend: [20, 40, 60, 80]});
</script>
@endsection