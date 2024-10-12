<x-layouts.app>

    <a href="{{ route('projects.show', 1) }}">
        primeiro projeto
    </a>

    {{-- @foreach ($this->projects as $project)
        <li>
            <a href="{{ route('projects.show', $project) }}">
                {{ $project->id }}. {{ $project->title }}
            </a>
        </li>
    @endforeach --}}

    <livewire:projects.index />

</x-layouts.app>
